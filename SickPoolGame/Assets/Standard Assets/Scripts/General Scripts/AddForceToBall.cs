using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AddForceToBall : MonoBehaviour {
    //Collision col = Collision.gameObject;
    //public float thrust;
    public Rigidbody rb;
    public Vector2 speed;
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	void Update () {
        if (Input.GetKeyDown("p"))
        {
            GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
        }

        speed = new Vector2(rb.velocity.x, rb.velocity.y);
    }

   
    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name == "White Ball" || col.gameObject.name == "Pool Cue")
        {
            //rb.GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
            speed = new Vector2(rb.velocity.x, rb.velocity.y);

        }
    }
}


