using UnityEngine;

public class WhiteBall : AbstractPoolBall
{
    public new void Update()
    {
        base.Update();
        
        // Temporary code to move the ball for debugging purposes
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
        // and deactivate the whiteball

        scoreboard.UpdateScore(-1);
        gameObject.SetActive(false);
    }
}
