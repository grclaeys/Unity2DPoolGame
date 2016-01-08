using UnityEngine;
using System.Collections;

public class TableToMenu : MonoBehaviour
{
    void Start()
    {

    }
    void Update()
    {

        if (Input.GetKeyDown(KeyCode.Escape))
            Application.LoadLevel("MainMenu");
    }
}

