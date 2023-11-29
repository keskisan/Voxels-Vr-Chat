
using Newtonsoft.Json.Linq;
using UdonSharp;
using UnityEngine;
using UnityEngine.UIElements;
using VRC.SDKBase;
using VRC.Udon;

[UdonBehaviourSyncMode(BehaviourSyncMode.Continuous)]
public class ToolAddTerrain : UdonSharpBehaviour
{
    [SerializeField]
    VoxelLandChunkManager chunkManager;

    [SerializeField]
    Transform indicator;
    bool pickedUp;

    Vector3 position;

    [SerializeField]
    bool Addterrain;

    [UdonSynced, FieldChangeCallback(nameof(PositionToAdd))]  //health > 0 player in game
    private Vector3 _positionToAdd;
    public Vector3 PositionToAdd
    {
        set
        {
            _positionToAdd = value;
            chunkManager.SetVoxelValue(_positionToAdd, Addterrain);

        }
        get => _positionToAdd;
    }



    private void Update()
    {
        if (pickedUp)
        {
            position = (transform.position + transform.forward * chunkManager.VoxelScale) / chunkManager.VoxelScale;

            indicator.position = new Vector3(Mathf.Round(position.x), Mathf.Round(position.y), Mathf.Round(position.z)) * chunkManager.VoxelScale;
        }
    }

    public override void OnPickup()
    {
        pickedUp = true;
    }

    public override void OnDrop()
    {
        pickedUp = false;
    }


    public override void OnPickupUseDown()
    {           
        if (Vector3.Distance(indicator.position, Networking.LocalPlayer.GetPosition()) > 1.5f) //dont build ontop of player
        {
            PositionToAdd = position;
        }        
    }


}
