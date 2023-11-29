
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;

[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class VoxelWallChankManager : UdonSharpBehaviour
{
    [SerializeField]
    VoxelWall[] voxelWalls;

    [SerializeField]
    LoadingDisplay loadingDisplay;

    [SerializeField]
    int width, breadth;

    public PerlinNoise perlinNoise;

    public float VoxelScale = 2f;

    public int xDir = 10, yDir = 15, zDir = 20;

    public float frequency = 0.5f, ySquash = 1f;

    public Vector3 randomiseNoise;
    public float cutoff = 0.3f;

    int networkUpdate = -1;
    bool waiting = false;
    float networkpercentage;
    float meshpercentage;

    void Start()
    {
        for (int x = 0; x < width; x++)
        {
            for (int z = 0; z < breadth; z++)
            {
                voxelWalls[x * breadth + z].transform.position = new Vector3(x * (xDir) * VoxelScale, 0f, z * (zDir) * VoxelScale);
            }
        }
    }

    public void SetVoxelValue(Vector3 position, bool Addterrain)
    {
        for (int i = 0; i < voxelWalls.Length; i++)
        {
            voxelWalls[i].SetVoxelValue(position, Addterrain);
        }

    }

    private void Update()
    {
        SendDataNetwork();
        CheckProgress();
    }

    private void CheckProgress()
    {
        meshpercentage = 0;
        networkpercentage = 0;
        for (int i = 0; i < voxelWalls.Length; i++)
        {
            meshpercentage += voxelWalls[i].percentageComplete;
            networkpercentage += voxelWalls[i].landNetworkUpdate.percentageComplete;
        }
        meshpercentage = meshpercentage / voxelWalls.Length;
        networkpercentage = networkpercentage / voxelWalls.Length;
        loadingDisplay.setWallMeshUpdateBar(meshpercentage);
        loadingDisplay.setWallNetworkUpdateBar(networkpercentage);
    }

    private void SendDataNetwork()
    {
        if (networkUpdate >= 0)
        {
            if (!waiting)
            {
                voxelWalls[networkUpdate].landNetworkUpdate.sendNew();
                waiting = true;
            }
            else
            {
                if (!voxelWalls[networkUpdate].landNetworkUpdate.updateDataBool)
                {
                    waiting = false;
                    networkUpdate--;
                }
            }

        }
    }

    public override void OnPlayerJoined(VRCPlayerApi player)
    {
        if (player.isMaster) return;
        if (Networking.IsOwner(gameObject))
        {
            networkUpdate = voxelWalls.Length - 1;
        }
    }
}
