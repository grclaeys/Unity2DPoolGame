using UnityEngine;

/// <summary>
/// A base class for all pool balls
/// Pool balls react to collisions with other pool balls and the table
/// by changing their momentum
/// When pool balls collide with any of the table's holes, they change the game state
/// based on the method OnScore
/// </summary>
public abstract class AbstractPoolBall : MonoBehaviour
{
    const string TABLE_HOLE_TAG = "Table Hole";
    const string SCOREBOARD_TAG = "Scoreboard";

    public Scoreboard scoreboard;
    private Vector2 originalPos;

    public void Start()
    {
        // Store original board position on start
        // so it can be reset to later
        originalPos = GetComponent<Transform>().position;
    }

    public void Update() { }

    /// <summary>
    /// Handles pool ball collisions
    /// On all collisions, the ball travels away with equal angles of incidence
    /// Collisions with the table are perfectly elastic
    /// Collisions with other balls are also elastic, with balls maintaining
    /// their prior speeds
    /// </summary>
    void OnCollisionEnter2D(Collision2D collision)
    {
        // If the collision was with one of the tables holes, call on score
        if (collision.collider.tag.CompareTo(TABLE_HOLE_TAG) == 0)
        {
            OnScore();
        }
    }

    /// <summary>
    /// Defines the balls behavior when it falls into
    /// a hole on the pool table
    /// </summary>
    protected abstract void OnScore();

    /// <summary>
    /// Returns the ball to its original position.
    /// Useful for resetting the table for a new game.
    /// </summary>
    public void ResetPosition()
    {
        GetComponent<Transform>().position = originalPos;
    }
}
