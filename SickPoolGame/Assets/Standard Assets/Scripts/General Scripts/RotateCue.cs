using UnityEngine;
using System.Collections;
using System;

public class RotateCue : MonoBehaviour
{
    // Use this for initialization
    void Start()
    {
        // Sets initial rotation to 120 degrees
        transform.eulerAngles.Set(0f, 0f, 120f);
    }

    // Update is called once per frame
    void Update()
    {
        // If left mouse button or other input equivalent is pressed, 
        // rotate the pool cue counter clockwise
        if (Input.GetButton("Fire1"))
        {
            transform.Rotate(0, 0, 1.2f);
        }

        // If right mouse button or other input system equivalent is pressed,
        // rotate the pool cue clockwise
        if (Input.GetButton("Fire2"))
        {
            transform.Rotate(0, 0, -1.2f);
        }

        // Outputs the cue's total rotation
        //Debug.Log(string.Format("The pool cue angle is: {0}", transform.eulerAngles.z));
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