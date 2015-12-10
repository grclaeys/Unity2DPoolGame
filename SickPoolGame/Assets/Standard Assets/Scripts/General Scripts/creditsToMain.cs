using UnityEngine;
using System.Collections;

public class CreditsToMain : MonoBehaviour
{


    void Start()
    {

    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.LoadLevel("mainMenu");
        }
    }
}
