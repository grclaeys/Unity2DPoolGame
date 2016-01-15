using UnityEngine;
using System.Collections;

public class particlesOn : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	 if(Input.GetKey("k"))
        {
            gameObject.GetComponent<ParticleSystem>().enableEmission = true;
        }

        if (Input.GetKey("j"))
        {
            gameObject.GetComponent<ParticleSystem>().enableEmission = false;
        }
    }
}
