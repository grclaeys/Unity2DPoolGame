using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenuState : MonoBehaviour
{
    void Start()
    {

    }

    void Update()
    {
        // Loads the main pool game on left click
        if (Input.GetMouseButtonDown(0))
        {
            SceneManager.LoadScene("poolTable");
        }
        // Loads the credits on right click
        if (Input.GetMouseButtonDown(1))
        {
            SceneManager.LoadScene("credits");
        }
    }
}
