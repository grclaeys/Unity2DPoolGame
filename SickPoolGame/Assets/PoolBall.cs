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
    /// <summary>
    /// Handles pool ball collisions
    /// On all collisions, the ball travels away with equal angles of incidence
    /// Collisions with the table are perfectly elastic
    /// Collisions with other balls are also elastic, with balls maintaining
    /// their prior speeds
    /// </summary>
    void OnCollisionEnter2D(Collision2D collision)
    {
        
        GetComponent<Rigidbody2D>().velocity;
    }

    /// <summary>
    /// Defines the balls behavior when it falls into
    /// a hole on the pool table
    /// </summary>
    protected abstract void OnScore();
}
