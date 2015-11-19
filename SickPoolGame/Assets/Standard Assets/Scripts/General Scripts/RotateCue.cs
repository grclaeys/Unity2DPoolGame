using UnityEngine;
using System.Collections;

public class RotateCue : MonoBehaviour {
    private float degree;
    private float angle;

    // Use this for initialization
    void Start ()
    {
	
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetButton("Fire1"))
        {
            transform.Rotate(0, 0, 1.2f);

        }

        if (Input.GetButton("Fire2"))
        {
            transform.Rotate(0, 0, -1.2f);
           
        }
    }

  
}
