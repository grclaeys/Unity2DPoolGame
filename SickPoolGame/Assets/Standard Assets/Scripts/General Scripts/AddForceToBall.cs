using UnityEngine;
using System.Collections;

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

        //if(Input.GetKeyDown("p")) {
        //    GetComponent<Rigidbody2D>().AddForce(Vector2.up * 500f);
        ////}
        //OnCollisionEnter(Collision);
    }


    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name == "White Ball")
        {
            foreach (ContactPoint contact in col.contacts)
            {
                GetComponent<Rigidbody2D>().AddForce(Vector2.up * 200f);

                //rb.AddForce(transform.forward * thrust);
                //other.rigidbody.AddForce(Vector2.up * hoverForce, ForceMode.Acceleration);
            }
        }
    }
}


