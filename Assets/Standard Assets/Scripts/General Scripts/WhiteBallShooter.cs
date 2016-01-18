using UnityEngine;
using System.Collections;
using System.Collections.Generic;
/// <summary>
/// When attached to an object, the object can be rotated by scrolling the mouse
/// wheel and holding left click will shoot out temporary white balls
/// </summary>
public class WhiteBallShooter : MonoBehaviour {
    // the speed the cue moves towards the mouse pointer
    const float CUE_MOVE_SPEED = 1.0f;
    // how fast the cue rotates
    const float SCROLL_SCALE = 1.5f;

    // the time in seconds white balls launched from this object last before being destroyed
    const float WHITE_BALL_LIFETIME = 3.0f;
    // the initial speed with which balls are launched
    const float LAUNCHED_BALL_SPEED = 15.0f;

    // the time in seconds that must pass before launching another ball
    const float BALL_SHOOT_INTERVAL = 0.25f;

    private float lastBallShot;

    public WhiteBall whiteBallTemplate;

    private Queue<ShotBall> shotBalls;

	void Start ()
    {
        lastBallShot = 0;
        shotBalls = new Queue<ShotBall>();
	}
	
	void Update ()
    {
        // Removes any white balls that have timed out
        while ((shotBalls.Count != 0) && 
                shotBalls.Peek().launchTime + WHITE_BALL_LIFETIME < Time.time)
        {
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

        // Moves the pool cue towards the mouse position
        Vector2 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        transform.position = Vector2.Lerp(transform.position, mousePosition, CUE_MOVE_SPEED);

        // Shoots a new white ball if middle mouse is down and no balls have been shot recently
        if (Input.GetButton("Fire3") && (lastBallShot + BALL_SHOOT_INTERVAL < Time.time))
        {
            lastBallShot = Time.time;
            var newBall = Instantiate(whiteBallTemplate);

            // Since the template ball is deactivated, the new ball needs to be activated
            newBall.gameObject.SetActive(true);
            
            // Set the position of the ball to the tip of the pool cue and the velocity
            // parallel to the direction of the pool cue
            Vector2 cueDirection = GetComponent<Transform>().rotation * Vector3.up;
            Vector2 ballPos = GetComponent<Transform>().position;
            Vector2 deltaPos = GetComponent<Transform>().rotation * Vector2.up;
            ballPos += deltaPos * 3.5f; // 3.5 = pool cue width approximation

            Vector3 ballVel = cueDirection * LAUNCHED_BALL_SPEED;

            newBall.GetComponent<Rigidbody2D>().velocity = ballVel;
            newBall.GetComponent<Rigidbody2D>().position = ballPos;

            // Add the ball to the list of shot balls along with the current time so it can
            // be deleted later
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
