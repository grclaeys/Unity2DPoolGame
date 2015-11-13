using UnityEngine;
using System.Collections;

public class MouseControll : MonoBehaviour {

	// Use this for initialization
	void Start () {
        Cursor.visible = false;
	}
	
	// Update is called once per frame
	void Update () {
        Vector3 mouse = Input.mousePosition;
        mouse = mouse * 10F;
        transform.position = Camera.main.ScreenToViewportPoint(mouse);
    }
}
