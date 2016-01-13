using UnityEngine;
using System.Collections;
using System.Collections.Generic;
/// <summary>
/// When attached to an object, the object can be rotated by scrolling the mouse
/// wheel and holding left click will shoot out temporary white balls
/// </summary>
public class WhiteBallShooter : MonoBehaviour {
    const float SCROLL_SCALE = 3.0f;

    private IList<int> shotBalls;

	void Start ()
    {
        shotBalls = new ArrayList();
	}
	
	// Update is called once per frame
	void Update ()
    {
        float scroll = 0.0f;
        if (Input.GetButton("Fire1"))
        {
            Debug.Log("left");
            scroll += 1.0f;
        }
        if (Input.GetButton("Fire2"))
        {
            scroll -= 1.0f;
        }
        GetComponent<Transform>().Rotate(Vector3.forward, scroll * SCROLL_SCALE);

        if (Input.GetButton("Fire3"))
        {
            Debug.Log("Shooting balls");

        }
	}
}
