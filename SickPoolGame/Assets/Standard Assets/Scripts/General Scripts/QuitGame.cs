﻿using UnityEngine;
using System.Collections;

public class TableToMenu : MonoBehaviour{
    void Update(){
        if (Input.GetKeyDown(KeyCode.Escape))
            Application.Quit();
    }
}
		
	
