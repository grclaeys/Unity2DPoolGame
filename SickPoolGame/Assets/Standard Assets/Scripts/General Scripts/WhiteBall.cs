using UnityEngine;
using System.Collections;

public class WhiteBall : PoolBall {
	// Update is called once per frame
	void Update () {
        //Debug.Log(ballBody.ToString());
        if (Input.GetKeyDown("a"))
        {
            ballBody.velocity.Set(-1, 0);
            Debug.Log(ballBody.velocity.ToString());
            //Debug.Log("A is down");
        }
	}

    protected override void OnScore() 
    {

    }
}
