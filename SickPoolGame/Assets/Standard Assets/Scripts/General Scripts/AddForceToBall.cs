using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AddForceToBall : MonoBehaviour {
    //Collision col = Collision.gameObject;
    //public float thrust;
    public Rigidbody rb;
    public Vector2 speed;
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

   
    void OnCollisionEnter(Collision col)
    {
    
            rb.GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
            speed = new Vector2(rb.velocity.x, rb.velocity.y);

        
          speed = new Vector2(rb.velocity.x, rb.velocity.y);
    }
}


