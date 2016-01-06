using UnityEngine;
using System.Collections;

public class WhiteBall : PoolBall {
    public new void Update()
    {
        base.Update();

        Vector2 newVelocity = GetComponent<Rigidbody2D>().velocity;

        if (Input.GetKey("a"))
        {
            newVelocity.x = -1;
            GetComponent<Rigidbody2D>().velocity = newVelocity;
        }
        if (Input.GetKey("d"))
        {
            newVelocity.x = 1;
            GetComponent<Rigidbody2D>().velocity = newVelocity;
        }
        if (Input.GetKey("w"))
        {
            newVelocity.y = 1;
            GetComponent<Rigidbody2D>().velocity = newVelocity;
        }
        if (Input.GetKey("s"))
        {
            newVelocity.y = -1;
            GetComponent<Rigidbody2D>().velocity = newVelocity;
        }
    }



    protected override void OnScore() 
    {
        // When the white ball falls in a hole, deduct 1 from the total score
        // and move the whiteball back to the center of the pool table
        Debug.Log("Score!");
    }
}
