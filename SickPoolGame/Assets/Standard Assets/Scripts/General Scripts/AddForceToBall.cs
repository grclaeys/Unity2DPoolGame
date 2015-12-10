using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AddForceToBall : MonoBehaviour {
    //Collision col = Collision.gameObject;
    //public float thrust;
    public Rigidbody rb;
    //public Vector2 speed;
    float NewX;
    float NewY;
    public bool simulated = true;
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	void Update () {

        if (Input.GetKeyDown("p"))
        {
            GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
        }

        //speed = new Vector2(rb.velocity.x, rb.velocity.y);
    }

   
    void OnCollisionEnter2D(Collision2D coll)
    {
    
       float totalAngle = RotateCue.getTotalAngle();
       NewX = Mathf.Cos(totalAngle);
       NewY = Mathf.Sin(totalAngle);

        Vector2 components = new Vector2(NewX, NewY);

        //Vector2 ayy = new Vector2(1, 0);

        GetComponent<Rigidbody2D>().AddForce(components * 370f);
        //GetComponent<Rigidbody2D>().AddForce(ayy * 370f);
        
    }
}


