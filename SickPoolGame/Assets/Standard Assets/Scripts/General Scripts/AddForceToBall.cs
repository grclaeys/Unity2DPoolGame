using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AddForceToBall : MonoBehaviour {
    //Collision col = Collision.gameObject;
    //public float thrust;
    public Rigidbody2D poolCue;
    //public Vector2 speed;
    float NewX;
    float NewY;
    public bool simulated = true;
    void Start () {
        //rb = GetComponent<Rigidbody>();
    }
	
	void Update () {

        if (Input.GetKeyDown("p"))
        {
            //GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
        }

        //speed = new Vector2(rb.velocity.x, rb.velocity.y);
    }

   
    void OnCollisionEnter2D(Collision2D coll)
    {
        if (coll.gameObject.name == "Pool Cue")
        {

            //float totalAngle = RotateCue.getTotalAngle();
            
            float totalAngle = poolCue.transform.eulerAngles.z/* / 100*/;

            Debug.Log(totalAngle);

            NewX = Mathf.Cos(totalAngle)/* * Mathf.Rad2Deg*/;
            NewY = Mathf.Sin(totalAngle)/* * Mathf.Rad2Deg*/;

            Vector2 components = new Vector2(NewX, NewY);
            //Debug.Log(components.ToString());
            //Vector2 ayy = new Vector2(1, 0);
            GetComponent<Rigidbody2D>().velocity = components * 20f;
            //GetComponent<Rigidbody2D>().AddForce(components * 300f);
            //GetComponent<Rigidbody2D>().AddForce(ayy * 370f);
        }
    }
}


