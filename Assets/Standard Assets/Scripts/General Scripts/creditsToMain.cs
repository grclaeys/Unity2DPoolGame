using UnityEngine;
//using UnityEngine.SceneManagement;

public class creditsToMain : MonoBehaviour
{


    void Start()
    {

    }

    void Update()
    {
        // Exit from credits to main menu when escape is pressed
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.LoadLevel("mainMenu");
            //SceneManager.LoadScene("mainMenu");
        }
    }
}
