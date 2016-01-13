using UnityEngine;
using System.Collections;
using System.Collections.Generic;
/// <summary>
/// When attached to an object, the object can be rotated by scrolling the mouse
/// wheel and holding left click will shoot out temporary white balls
/// </summary>
public class WhiteBallShooter : MonoBehaviour {
    const float SCROLL_SCALE = 3.0f;
    const float WHITE_BALL_LIFETIME = 3.0f;

    public WhiteBall whiteBallTemplate;

    private Queue<ShotBall> shotBalls;

	void Start ()
    {
        shotBalls = new Queue<ShotBall>();
	}
	
	void Update ()
    {
        // Removes any white balls that have timed out
        while ((shotBalls.Count != 0) && 
                shotBalls.Peek().launchTime + WHITE_BALL_LIFETIME < Time.time)
        {
            Debug.Log("Destroying white ball");
            Destroy(shotBalls.Dequeue().ball.gameObject);
        }

        // Rotates the pool cue
        float scroll = 0.0f;
        if (Input.GetButton("Fire1"))
        {
            scroll += 1.0f;
        }
        if (Input.GetButton("Fire2"))
        {
            scroll -= 1.0f;
        }
        GetComponent<Transform>().Rotate(Vector3.forward, scroll * SCROLL_SCALE);

        // Shoots a new white ball if middle mouse is down
        if (Input.GetButton("Fire3"))
        {
            // Debug.Log("Shooting balls");
            var newBall = Instantiate(whiteBallTemplate);
            newBall.GetComponent<Rigidbody2D>().position = GetComponent<Transform>().position;
            newBall.GetComponent<Rigidbody2D>().velocity.Set(1, 1);
            shotBalls.Enqueue(new ShotBall(newBall));
        }
	}

    private struct ShotBall
    {
        public WhiteBall ball;
        public float launchTime;

        public ShotBall(WhiteBall ball)
        {
            this.ball = ball;
            this.launchTime = Time.time;
        }
    }
}
