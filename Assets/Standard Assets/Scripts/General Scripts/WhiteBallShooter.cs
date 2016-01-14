using UnityEngine;
using System.Collections;
using System.Collections.Generic;
/// <summary>
/// When attached to an object, the object can be rotated by scrolling the mouse
/// wheel and holding left click will shoot out temporary white balls
/// </summary>
public class WhiteBallShooter : MonoBehaviour {
    const float CUE_MOVE_SPEED = 1.0f;
    const float SCROLL_SCALE = 1.0f;

    const float WHITE_BALL_LIFETIME = 3.0f;
    const float LAUNCHED_BALL_SPEED = 5.0f;

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

        // Shoots a new white ball if middle mouse is down
        if (Input.GetButton("Fire3"))
        {
            var newBall = Instantiate(whiteBallTemplate);
            Vector2 cueDirection = GetComponent<Transform>().rotation * Vector3.up;
            Vector2 ballPos = GetComponent<Transform>().position;
            ballPos += (Vector2)GetComponent<BoxCollider2D>().bounds.size;

            //Debug.Log(GetComponent<BoxCollider2D>().bounds.size.magnitude);
            Debug.Log(GetComponent<Transform>().position + GetComponent<Transform>().localScale);

            Vector3 ballVel = cueDirection * LAUNCHED_BALL_SPEED;

            newBall.GetComponent<Rigidbody2D>().velocity = ballVel;
            newBall.GetComponent<Rigidbody2D>().position = ballPos;
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
