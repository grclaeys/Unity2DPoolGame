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
    const string TABLE_HOLE_TAG = "Table Hole";
    const string POOL_BALL_TAG = "asdf";

    void Start()
    {
        
    }

    public void Update()
    {
        if (Input.GetKey("q"))
        {
            Debug.Log("Pool Ball Update");
        }
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

        // gets the line normal to the collision
        Vector3 collisionNormalTemp = Vector3.Cross(averagePoint - self.position, new Vector3(0, 0, 1));
        Debug.Log(string.Format("Original Velocity: {0}\tFinal: {1}", 
                                self.velocity.ToString(), Vector2.Reflect(self.velocity, collisionNormalTemp).ToString()));

        // reflects the velocity of this rigid body about the collision line
        self.velocity = Vector2.Reflect(self.velocity, collisionNormalTemp);

        // If the collision was with one of the tables holes, call on score
        if (collision.transform.tag.CompareTo(TABLE_HOLE_TAG) == 0)
        {
            OnScore();
        }

        // May not be needed as each ball will update its own velocity
        // Otherwise, if the collision was with another ball, update the other balls velocity
        //else if (collision.collider.tag.CompareTo(POOL_BALL_TAG) == 0)
        //{

        //}
        // Otherwise, the collision was with the table, so no extra updates need to be done
    }

    /// <summary>
    /// Defines the balls behavior when it falls into
    /// a hole on the pool table
    /// </summary>
    protected abstract void OnScore();
}
