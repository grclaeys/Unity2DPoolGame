using UnityEngine;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class printText : MonoBehaviour {
    int score = 0;

	// Use this for initialization
	void Start () {
        GameObject newGO = new GameObject("myText");
        newGO.transform.SetParent(this.transform);

        Text myText = newGO.AddComponent<Text>();
        myText.text = "Score: " + score;
    }
	
	// Update is called once per frame
	void Update () {
	
	}
}
