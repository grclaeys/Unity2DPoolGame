using UnityEngine;
using System.Collections;

public class OpenGame : MonoBehaviour {

	// Use this for initialization
	void Start () {
        //Application.LoadLevel("poolTable");
    }
	
	// Update is called once per frame
	void Update () {
	
	}
    void onGui()
    {
        Application.LoadLevel("PoolTable");
    }
}
