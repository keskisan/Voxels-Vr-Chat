
using System;
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using VRC.Udon.Wrapper.Modules;

[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class VoxelLandChunkManager : UdonSharpBehaviour
{
    [SerializeField]
    VoxelLand[] voxelLands;

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
                voxelLands[x * breadth + z].transform.position = new Vector3(x * (xDir) * VoxelScale, 0f, z * (zDir) * VoxelScale);

                if (x > 0)
                {
                    voxelLands[x * breadth + z].neighborXminus = voxelLands[(x - 1) * breadth + z];
                } else
                {
                    voxelLands[x * breadth + z].neighborXminus = null;
                }

                if (x < width - 1)
                {
                    voxelLands[x * breadth + z].neighborXplus = voxelLands[(x + 1) * breadth + z];
                }
                else
                {
                    voxelLands[x * breadth + z].neighborXplus = null;
                }


                if (z > 0)
                {
                    voxelLands[x * breadth + z].neighborZminus = voxelLands[x * breadth + z - 1];
                }
                else
                {
                    voxelLands[x * breadth + z].neighborZminus = null;
                }

                if (z < breadth - 1)
                {
                    voxelLands[x * breadth + z].neighborZplus = voxelLands[x * breadth + z + 1];
                }
                else
                {
                    voxelLands[x * breadth + z].neighborZplus = null;
                }
            }
        }
    }

    public void SetVoxelValue(Vector3 position, bool Addterrain)
    {
        for (int  i = 0; i < voxelLands.Length; i++)
        {
            voxelLands[i].SetVoxelValue(position, Addterrain);
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
        for (int i = 0; i < voxelLands.Length; i++)
        {
            meshpercentage += voxelLands[i].percentageComplete;
            networkpercentage += voxelLands[i].landNetworkUpdate.percentageComplete;
        }
        meshpercentage = meshpercentage / voxelLands.Length;
        networkpercentage = networkpercentage / voxelLands.Length;
        loadingDisplay.setLandMeshUpdateBar(meshpercentage);
        loadingDisplay.setLandNetworkUpdateBar(networkpercentage);
    }

    private void SendDataNetwork()
    {
        if (networkUpdate >= 0)
        {
            if (!waiting)
            {
                voxelLands[networkUpdate].landNetworkUpdate.sendNew();
                waiting = true;
            }
            else
            {
                if (!voxelLands[networkUpdate].landNetworkUpdate.updateDataBool)
                {
                    waiting = false;
                    networkUpdate--;
                }
            }

        }
    }

    public override void OnPlayerJoined(VRCPlayerApi player)
    {
        if (player.isMaster) return; //stops from executing this when game first start
        if (Networking.IsOwner(gameObject))
        {
            networkUpdate = voxelLands.Length - 1;
        }
    }
}
