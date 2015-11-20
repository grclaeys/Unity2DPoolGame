using UnityEngine;
using System.Collections;

public class AddForceToBall : MonoBehaviour {
    //Collision col = Collision.gameObject;
    public float thrust;
    public Rigidbody rb;
    public float hoverForce;
    // Use this for initialization
    void Start () {
        rb = GetComponent<Rigidbody>();
    }
	
	// Update is called once per frame
	void Update () {
        //OnCollisionEnter(Collision.gameObject);
        //rb.AddForce(transform.forward * thrust);
        other.rigidbody.AddForce(Vector2.up * hoverForce, ForceMode.Acceleration);
    }


    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name == "Pool Cue")
        {
            //rb.AddForce(transform.forward * thrust);
            other.rigidbody.AddForce(Vector2.up * hoverForce, ForceMode.Acceleration);

        }
    }
}


