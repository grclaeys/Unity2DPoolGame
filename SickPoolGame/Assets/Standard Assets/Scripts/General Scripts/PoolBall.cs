using UnityEngine;
using System.Collections;

/// <summary>
/// A base class for all pool balls
/// Pool balls react to collisions with other pool balls and the table
/// by changing their momentum
/// When pool balls collide with any of the table's holes, they change the game state
/// based on the method OnScore
/// </summary>
public abstract class PoolBall : MonoBehaviour {
    public Rigidbody2D ballBody;

    void Start()
    {
        ballBody = GetComponent<Rigidbody2D>();
    }

    /// <summary>
    /// Handles pool ball collisions
    /// On all collisions, the ball travels away with equal angles of incidence
    /// Collisions with the table are perfectly elastic
    /// Collisions with other balls are also elastic, with balls maintaining
    /// their prior speeds
    /// </summary>
    void OnCollisionEnter2D(Collision2D collision)
    {
        Rigidbody2D self = GetComponent<Rigidbody2D>();
        ContactPoint2D[] contactPoints = collision.contacts;

        // finds the "average" collision point by adding together all
        // collision points and dividing by the number of points
        Vector2 averagePoint = new Vector2(0, 0);

        foreach (ContactPoint2D collisionPoint in collision.contacts)
        {
            averagePoint += collisionPoint.point;
        }

        
        averagePoint.Scale(new Vector2(1.0f / (collision.contacts.Length), 
                           1.0f / (collision.contacts.Length)));

        // gets the line along which the collision occurs
        // the angle of incidence = the angle between this line and the bodies velocity
        //Vector2 collisionLine = GetComponent<Rigidbody2D>().position - averagePoint;
        //Vector2 collisionNormal = new Vector2();
        Vector3 collisionNormalTemp = Vector3.Cross(averagePoint - self.position, new Vector3(0, 0, 1));
        
        // reflects the velocity of this rigid body about the collision line
        self.velocity = Vector2.Reflect(self.velocity, collisionNormalTemp);
        
    }

    /// <summary>
    /// Defines the balls behavior when it falls into
    /// a hole on the pool table
    /// </summary>
    protected abstract void OnScore();
}
