﻿using UnityEngine;
using System.Collections;

public class MouseControll : MonoBehaviour {

    private Vector3 mousePosition;
    public float moveSpeed = 0.1f;

    // Use this for initialization
    void Start () {
        Cursor.visible = false;
	}
	
	// Update is called once per frame
	void Update () {
        mousePosition = Input.mousePosition;
        mousePosition = Camera.main.ScreenToWorldPoint(mousePosition);
        transform.position = Vector2.Lerp(transform.position, mousePosition, moveSpeed);
        // Xd();
    }

    void Xd () {
      //  while (true) {
            
        //}
    }
}
