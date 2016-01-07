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
    float totalAngle;
    void Start () {
        //rb = GetComponent<Rigidbody>();
    }
	
	void Update () {
        poolCue = GetComponent<Rigidbody2D>();

        if (Input.GetKeyDown("p"))
        {
            //GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
        }

        //speed = new Vector2(rb.velocity.x, rb.velocity.y);


        //float test = poolCue.transform.eulerAngles.z + 90/*+ 90 /* / 100*/;
        totalAngle = (poolCue.transform.eulerAngles.z) % 360;
        //if(test < 360)
        //{
        //    totalAngle = poolCue.transform.eulerAngles.z + 90/*+ 90*/;
        //} if(test > 360)
        //{
        //    totalAngle = 360 - (poolCue.transform.eulerAngles.z + 90); /*+ 90)*/
        //}
        //if(test < -1 && test > -90)
        //{
        //    totalAngle = Mathf.Abs(poolCue.transform.eulerAngles.z + 90); /*+ 90)*/
        //}

        Debug.Log(totalAngle);
    }

   
    void OnCollisionEnter2D(Collision2D coll)
    {
        if (coll.gameObject.name == "Pool Cue")
        {

            //float totalAngle = RotateCue.getTotalAngle();
            
            

            NewX = Mathf.Cos(totalAngle * Mathf.Deg2Rad)/* * Mathf.Rad2Deg*/;
            NewY = Mathf.Sin(totalAngle * Mathf.Deg2Rad)/* * Mathf.Rad2Deg*/;

            Vector2 components = new Vector2(NewX, NewY);
            //Debug.Log(components.ToString());
            //Vector2 ayy = new Vector2(1, 0);
            GetComponent<Rigidbody2D>().velocity = components * 12f;
            //GetComponent<Rigidbody2D>().AddForce(components * 300f);
            //GetComponent<Rigidbody2D>().AddForce(ayy * 370f);
        }
    }
}


