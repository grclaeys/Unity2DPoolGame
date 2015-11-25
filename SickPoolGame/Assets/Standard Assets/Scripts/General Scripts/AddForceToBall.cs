using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AddForceToBall : MonoBehaviour {
    //Collision col = Collision.gameObject;
    //public float thrust;
    public Rigidbody rb;
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	// Update is called once per frame
	void Update () {
        //OnCollisionEnter(Collision.gameObject);
        //rb.AddForce(transform.forward * thrust);
        //other.rigidbody.AddForce(Vector2.up * hoverForce, ForceMode.Acceleration);

        if (Input.GetKeyDown("p"))
        {
            GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);
        }
        //OnCollisionEnter(Collision);
    }


    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name == "White Ball" || col.gameObject.name == "Pool Cue")
        {
            //foreach (ContactPoint contact in col)
            //{

                GetComponent<Rigidbody2D>().AddForce(Vector2.up * 1000f);

            //}
        }
    }
}


