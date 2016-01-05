using UnityEngine;
using System.Collections;

public class creditsToMain : MonoBehaviour
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
