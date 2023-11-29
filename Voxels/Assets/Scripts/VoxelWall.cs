
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[UdonBehaviourSyncMode(BehaviourSyncMode.Manual)]
public class VoxelWall : UdonSharpBehaviour
{
    [SerializeField]
    VoxelWallChankManager chunkManager;

    public VoxelWallNetworking landNetworkUpdate;

    [HideInInspector]
    public int maxLength;

    [SerializeField]
    MeshCollider meshCollider;

    [HideInInspector]
    public bool[] voxelArray;

    [HideInInspector]
    public int[] voxelArrayBufferNetworking;
    [HideInInspector]
    public int voxelArrayBufferNetworkingCounter;

    [SerializeField, Range(1, 500)]
    int counter = 100;

    float workDone = 0;
    float workNeedToBeDone;

    [HideInInspector]
    public float percentageComplete; //this the veriable to indicate progress


    Mesh mesh;

    Vector3[] newVertices;
    int VerticeCounter;
    Vector2[] newUV;
    int[] newTriangles;
    int TriangleCounter;

    int voxelValuesX, voxelValuesY, voxelValuesZ, voxelValuesCounter;

    bool hasCalculateVoxels = false, hasSetVoxelNoise = false, meshDrawed = false;

    void Start()
    {
        mesh = gameObject.GetComponent<MeshFilter>().mesh;
        DefaultValuesAndSettings();
        
    }


    public void NetworkedUpdateVoxelSettings(bool[] updatedVoxels)
    {
        maxLength = chunkManager.xDir * chunkManager.yDir * chunkManager.zDir;
        voxelArray = updatedVoxels;
        hasSetVoxelNoise = true;

        BasicVoxelSetup();
    }

    void DefaultValuesAndSettings()
    {
        maxLength = chunkManager.xDir * chunkManager.yDir * chunkManager.zDir;
        workNeedToBeDone = maxLength;
        voxelArray = new bool[maxLength];

        hasSetVoxelNoise = false;
        ResetVoxelArrayBufferNetworking();
        BasicVoxelSetup();
    }

    public void ResetVoxelArrayBufferNetworking()
    {
        voxelArrayBufferNetworking = new int[100];
        voxelArrayBufferNetworkingCounter = 0;
    }

    void UpdateVoxelsSettings()
    {
        BasicVoxelSetup();
    }

    private void BasicVoxelSetup()
    {
        voxelValuesX = voxelValuesY = voxelValuesZ = voxelValuesCounter = 0;

        VerticeCounter = 0;
        TriangleCounter = 0;

        newVertices = new Vector3[24000];
        newUV = new Vector2[24000];
        newTriangles = new int[36000];

        hasCalculateVoxels = false;
        meshDrawed = false;

        workDone = 0;
    }

    float beginDelay;

    private void Update()
    {
        if (beginDelay < 1f)
        {
            beginDelay += Time.deltaTime;
            return;
        }

        //if (!hasSetVoxelNoise)
        //{
        //    SetVoxelNoise();
        //}
        else if (!hasCalculateVoxels)
        {
            CalculateVoxels();
        }
        else if (!meshDrawed)
        {
            DrawMesh();
        }

        percentageComplete = workDone / workNeedToBeDone;
    }

    void SetVoxelNoise()
    {
        for (int i = 0; i < counter; i++)
        {
            workDone++;

            voxelArray[voxelValuesCounter] = chunkManager.perlinNoise.get3DPerlinNoise(new Vector3(
                voxelValuesX + chunkManager.randomiseNoise.x + (transform.position.x / chunkManager.VoxelScale),
                voxelValuesY * chunkManager.ySquash + chunkManager.randomiseNoise.y,
                voxelValuesZ + chunkManager.randomiseNoise.z + (transform.position.z / chunkManager.VoxelScale)),
                chunkManager.frequency) < chunkManager.cutoff ? false : true;

            voxelValuesCounter++;
            voxelValuesZ++;
            if (voxelValuesZ == chunkManager.zDir)
            {
                voxelValuesZ = 0;
                voxelValuesY++;
            }
            if (voxelValuesY == chunkManager.yDir)
            {
                voxelValuesY = 0;
                voxelValuesX++;
            }
            if (voxelValuesX == chunkManager.xDir)
            {
                hasSetVoxelNoise = true;
                voxelValuesX = voxelValuesY = voxelValuesZ = voxelValuesCounter = 0;
                return;
            }
        }
    }

    void CalculateVoxels()
    {
        for (int i = 0; i < counter; i++)
        {
            workDone++;

            if (voxelArray[voxelValuesCounter]) //only add mesh if it is
            {
                CheckZPosFace(voxelValuesX, voxelValuesY, voxelValuesZ);
                CheckZNegFace(voxelValuesX, voxelValuesY, voxelValuesZ);
                CheckYPosFace(voxelValuesX, voxelValuesY, voxelValuesZ);
                CheckYNegFace(voxelValuesX, voxelValuesY, voxelValuesZ);
                CheckXPosFace(voxelValuesX, voxelValuesY, voxelValuesZ);
                CheckXNegFace(voxelValuesX, voxelValuesY, voxelValuesZ);
            }

            voxelValuesCounter++;
            voxelValuesZ++;
            if (voxelValuesZ == chunkManager.zDir)
            {
                voxelValuesZ = 0;
                voxelValuesY++;
            }
            if (voxelValuesY == chunkManager.yDir)
            {
                voxelValuesY = 0;
                voxelValuesX++;
            }
            if (voxelValuesX == chunkManager.xDir)
            {
                hasCalculateVoxels = true;
                return;
            }
        }
    }

    public void SetVoxelValue(Vector3 position, bool value) //position can be outside range
    {
        position = position - transform.position / chunkManager.VoxelScale;
        int x = Mathf.RoundToInt(position.x);
        int y = Mathf.RoundToInt(position.y);
        int z = Mathf.RoundToInt(position.z);

        if (x < 0) return;
        if (y < 0) return;
        if (z < 0) return;
        if (x >= chunkManager.xDir) return;
        if (y >= chunkManager.yDir) return;
        if (z >= chunkManager.zDir) return;

        int positionInArray = z + chunkManager.zDir * y + chunkManager.zDir * chunkManager.yDir * x;

        if (voxelArray[positionInArray] != value)
        {
            voxelArray[positionInArray] = value;

            AddValueVoxelArrayBufferNetworking(value ? positionInArray : -positionInArray);

            UpdateVoxelsSettings();
        }
    }

    public void AddValueVoxelArrayBufferNetworking(int value) //positive values true negatives false
    {
        voxelArrayBufferNetworking[voxelArrayBufferNetworkingCounter] = value;
        voxelArrayBufferNetworkingCounter++;

        if (voxelArrayBufferNetworkingCounter == voxelArrayBufferNetworking.Length)
        {
            voxelArrayBufferNetworkingCounter = 0;
        }
    }

    public bool GetVoxelValue(int x, int y, int z)
    {
        return voxelArray[z + chunkManager.zDir * y + chunkManager.zDir * chunkManager.yDir * x];
    }


    void AddFaceZpos(int x, int y, int z)
    {
        if (y == chunkManager.yDir - 1) //top so be grass
        {
            AddQuad(
                   new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
        }
        else
        {
            if (GetVoxelValue(x, y + 1, z)) //block ontop so ground
            {
                AddQuad(
                   new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
                   new Vector2(0f, 0f),
                   new Vector2(0f, 0.33f),
                   new Vector2(1f, 0.33f),
                   new Vector2(1f, 0f)
               );
            }
            else //top so be grass
            {
                AddQuad(
                   new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
            }
        }
    }

    void AddFaceZneg(int x, int y, int z)
    {
        if (y == chunkManager.yDir - 1) //top so be grass
        {
            AddQuad(
                    new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),
                    new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                    new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                    new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
        }
        else
        {
            if (GetVoxelValue(x, y + 1, z)) //block ontop so ground
            {
                AddQuad(
                    new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),
                    new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                    new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                    new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
                   new Vector2(0f, 0f),
                   new Vector2(0f, 0.33f),
                   new Vector2(1f, 0.33f),
                   new Vector2(1f, 0f)
               );
            }
            else //top so be grass
            {
                AddQuad(
                    new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),
                    new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                    new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                    new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
            }
        }
    }

    void AddFaceYpos(int x, int y, int z)
    {
        AddQuad(
                   new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                   new Vector2(0f, 0.66f),
                   new Vector2(0f, 1f),
                   new Vector2(1f, 1f),
                   new Vector2(1f, 0.66f)
               );
    }

    void AddFaceYneg(int x, int y, int z)
    {
        AddQuad(
            new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
            new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
            new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
            new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),

            new Vector2(0f, 0f),
            new Vector2(0f, 0.33f),
            new Vector2(1f, 0.33f),
            new Vector2(1f, 0f)
       );

    }

    void AddFaceXpos(int x, int y, int z)
    {
        if (y == chunkManager.yDir - 1) //top so be grass
        {
            AddQuad(
                new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
                new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
                new Vector2(0f, 0.33f),
                new Vector2(0f, 0.66f),
                new Vector2(1f, 0.66f),
                new Vector2(1f, 0.33f)
               );
        }
        else
        {
            if (GetVoxelValue(x, y + 1, z)) //block ontop so ground
            {
                AddQuad(
                   new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
                   new Vector2(0f, 0f),
                   new Vector2(0f, 0.33f),
                   new Vector2(1f, 0.33f),
                   new Vector2(1f, 0f)
               );
            }
            else //top so be grass
            {
                AddQuad(
                   new Vector3(x + 0.5f, y - 0.5f, z - 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z - 0.5f),
                   new Vector3(x + 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x + 0.5f, y - 0.5f, z + 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
            }
        }
    }

    void AddFaceXneg(int x, int y, int z)
    {
        if (y == chunkManager.yDir - 1) //top so be grass
        {
            AddQuad(
                   new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                   new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
        }
        else
        {
            if (GetVoxelValue(x, y + 1, z)) //block ontop so ground
            {
                AddQuad(
                   new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                   new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),
                   new Vector2(0f, 0f),
                   new Vector2(0f, 0.33f),
                   new Vector2(1f, 0.33f),
                   new Vector2(1f, 0f)
               );
            }
            else //top so be grass
            {
                AddQuad(
                   new Vector3(x - 0.5f, y - 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z + 0.5f),
                   new Vector3(x - 0.5f, y + 0.5f, z - 0.5f),
                   new Vector3(x - 0.5f, y - 0.5f, z - 0.5f),
                   new Vector2(0f, 0.33f),
                   new Vector2(0f, 0.66f),
                   new Vector2(1f, 0.66f),
                   new Vector2(1f, 0.33f)
               );
            }
        }

    }


    void AddQuad(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4, Vector2 v1, Vector2 v2, Vector2 v3, Vector2 v4)
    {
        newVertices[VerticeCounter] = p1 * chunkManager.VoxelScale; //1
        newUV[VerticeCounter] = v1;
        VerticeCounter++;
        newVertices[VerticeCounter] = p2 * chunkManager.VoxelScale; //2
        newUV[VerticeCounter] = v2;
        VerticeCounter++;
        newVertices[VerticeCounter] = p3 * chunkManager.VoxelScale; //3
        newUV[VerticeCounter] = v3;
        VerticeCounter++;
        newVertices[VerticeCounter] = p4 * chunkManager.VoxelScale; //4
        newUV[VerticeCounter] = v4;
        VerticeCounter++;

        newTriangles[TriangleCounter] = VerticeCounter - 4; //1
        TriangleCounter++;
        newTriangles[TriangleCounter] = VerticeCounter - 3; //2
        TriangleCounter++;
        newTriangles[TriangleCounter] = VerticeCounter - 2; //3
        TriangleCounter++;
        newTriangles[TriangleCounter] = VerticeCounter - 2; //3 
        TriangleCounter++;
        newTriangles[TriangleCounter] = VerticeCounter - 1; //4
        TriangleCounter++;
        newTriangles[TriangleCounter] = VerticeCounter - 4; //1
        TriangleCounter++;
    }


    void CheckZPosFace(int x, int y, int z)
    {
        if (z == chunkManager.zDir - 1) //if at edge add face
        {
            AddFaceZpos(x, y, z);
        }
        else
        {
            if (!GetVoxelValue(x, y, z + 1)) //if not voxel next to addface
            {
                AddFaceZpos(x, y, z);
            }
        }
    }

    void CheckZNegFace(int x, int y, int z)
    {
        if (z == 0) //if at edge add face
        {
            AddFaceZneg(x, y, z);
        }
        else
        {
            if (!GetVoxelValue(x, y, z - 1)) //if not voxel next to addface
            {
                AddFaceZneg(x, y, z);
            }
        }
    }

    void CheckYPosFace(int x, int y, int z)
    {
        if (y == chunkManager.yDir - 1) //if at edge add face
        {
            AddFaceYpos(x, y, z);
        }
        else
        {
            if (!GetVoxelValue(x, y + 1, z)) //if not voxel next to addface
            {
                AddFaceYpos(x, y, z);
            }
        }
    }

    void CheckYNegFace(int x, int y, int z)
    {
        if (y == 0) //if at edge add face
        {
            AddFaceYneg(x, y, z);
        }
        else
        {
            if (!GetVoxelValue(x, y - 1, z)) //if not voxel next to addface
            {
                AddFaceYneg(x, y, z);
            }
        }
    }

    void CheckXPosFace(int x, int y, int z)
    {
        if (x == chunkManager.xDir - 1) //if at edge add face
        {
            AddFaceXpos(x, y, z);
        }
        else
        {
            if (!GetVoxelValue(x + 1, y, z)) //if not voxel next to addface
            {
                AddFaceXpos(x, y, z);
            }
        }
    }

    void CheckXNegFace(int x, int y, int z)
    {
        if (x == 0) //if at edge add face
        {
            AddFaceXneg(x, y, z);
        }
        else
        {
            if (!GetVoxelValue(x - 1, y, z)) //if not voxel next to addface
            {
                AddFaceXneg(x, y, z);
            }
        }
    }

    void DrawMesh()
    {
        if (VerticeCounter == 0) return;
        mesh.Clear();
        Vector3[] tmpVertices = new Vector3[VerticeCounter];
        Array.Copy(newVertices, 0, tmpVertices, 0, VerticeCounter);
        Vector2[] tmpUVS = new Vector2[VerticeCounter];
        Array.Copy(newUV, 0, tmpUVS, 0, VerticeCounter);
        int[] tmpTriangles = new int[TriangleCounter];
        Array.Copy(newTriangles, 0, tmpTriangles, 0, TriangleCounter);
        mesh.vertices = tmpVertices;
        mesh.uv = tmpUVS;
        mesh.triangles = tmpTriangles;
        mesh.RecalculateNormals();
        mesh.RecalculateTangents();
        meshCollider.sharedMesh = mesh;
        meshDrawed = true;
    }
}
