using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AddForceToBall : MonoBehaviour {

    public Rigidbody2D poolCue;
    float NewX;
    float NewY;
    public bool simulated = true;
    float totalAngle;
    void Start () {
        
    }
	
	void Update () {
        poolCue = GetComponent<Rigidbody2D>();

        if (Input.GetKeyDown("p"))
        {
            
        }

        totalAngle = (poolCue.transform.eulerAngles.z) % 360;

        //Debug.Log(totalAngle);
    }

   
    void OnCollisionEnter2D(Collision2D coll)
    {
        if (coll.gameObject.name == "Pool Cue")
        {

            NewX = Mathf.Cos(totalAngle * Mathf.Deg2Rad);
            NewY = Mathf.Sin(totalAngle * Mathf.Deg2Rad);

            Vector2 components = new Vector2(NewX, NewY);

            GetComponent<Rigidbody2D>().velocity = components * 12f;

        }
    }
}


