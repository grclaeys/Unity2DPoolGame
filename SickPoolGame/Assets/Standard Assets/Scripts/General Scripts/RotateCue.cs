using UnityEngine;
using System.Collections;
using System;

public class RotateCue : MonoBehaviour {
    private static float degree;
    private static float angle;
    public static float totalAngle = 120f;

    // Use this for initialization
    void Start ()
    {
	
	}
	
	// Update is called once per frame
	void Update () {
        if (Input.GetButton("Fire1"))
        {
            transform.Rotate(0, 0, 1.2f);

            totalAngle += 3f;

            if(totalAngle > 365f)
            {
                totalAngle = 0f;
            }
        }

        if (Input.GetButton("Fire2"))
        {
            transform.Rotate(0, 0, -1.2f);
            totalAngle -= 3f;

            if (totalAngle < 0f)
            {
                totalAngle = 0f;
            }
        }
        
    }

   public static float getTotalAngle()
    {
        //totalAngle = this.totalAngle;
        totalAngle = totalAngle * Mathf.Deg2Rad;
        return totalAngle;
    }

    //internal static float getTotalAngle()
    //{
    //    throw new NotImplementedException();
    //}

    //float setTotalAngle(float totalAngle)
    //{
    //    return ayy;
    //}
}
