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
       
        if(Input.GetKeyDown("p")) {
            GetComponent<Rigidbody2D>().AddForce(Vector2.up * 500f);
        }
    }


    void OnCollisionEnter(Collision col)
    {
        if (col.gameObject.name == "Pool Cue")
        {
            GetComponent<Rigidbody2D>().AddForce(Vector2.up * 200f);

        }
    }
}


