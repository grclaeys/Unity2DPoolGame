﻿using UnityEngine;
using System.Collections;

public class OpenGame : MonoBehaviour
{

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Application.LoadLevel("poolTable");
        }
        if (Input.GetMouseButtonDown(1))
        {
            Application.LoadLevel("credits");
        }
    }
    void onGui()
    {
    }
}
