
using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon;
using UnityEngine.UI;

[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class LoadingDisplay : UdonSharpBehaviour
{
    [SerializeField]
    Slider meshLandUpdate, networkLandUpdate, meshWallUpdate, networkWallUpdate, meshLandUpdateInGame, networkLandUpdateInGame, meshWallUpdateInGame, networkWallUpdateInGame;

    [SerializeField]
    Transform inGameMenu;

    VRCPlayerApi localPlayer;

    public void setLandMeshUpdateBar(float value)
    {
        meshLandUpdateInGame.value = meshLandUpdate.value = value;
    }

    public void setLandNetworkUpdateBar(float value)
    {
        networkLandUpdateInGame.value = networkLandUpdate.value = value;
    }

    public void setWallMeshUpdateBar(float value)
    {
        meshWallUpdateInGame.value = meshWallUpdate.value = value;
    }

    public void setWallNetworkUpdateBar(float value)
    {
        networkWallUpdateInGame.value = networkWallUpdate.value = value;
    }

    private void Start()
    {
        localPlayer = Networking.LocalPlayer;
    }

    private void Update()
    {
        if (localPlayer.IsUserInVR())
        {
            inGameMenu.transform.position = localPlayer.GetBonePosition(HumanBodyBones.LeftHand);
            inGameMenu.transform.rotation = localPlayer.GetBoneRotation(HumanBodyBones.LeftHand);
        }
    }
}
