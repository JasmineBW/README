//
//  ViewController.swift
//  read.me
//
//  Created by Jasmine Ben-Whyte on 17/4/24.
//

import UIKit
import Nuke
import NukeExtensions

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var library: [Book] = []

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        
        let book = library[indexPath.row]
        cell.titleLabel?.text = book.title
        cell.overviewLabel?.text = book.overview
        let picture = book.posterPath
        NukeExtensions.loadImage(with: picture, into: cell.posterPathImageView)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        library = createMockBookData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        let  selectedBook = library[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        detailViewController.book = selectedBook
    }


    private func createMockBookData() -> [Book] {
        let book1 = Book(title: "The Guardian of the Forest",
                         overview: "In \"The Guardian of the Forest,\" a young squirrel named Pippin embarks on a quest to save the ancient oak tree that protects the woodland and all its creatures. When the tree shows signs of a dark force threatening its life, Pippin, along with a brave fox and a swift bluebird, sets off to find the elusive Sun's Tear, the only cure for the dark roots. Through their courage and teamwork, they navigate treacherous terrain and perilous dangers to restore life to the forest. This heartwarming tale is a testament to the power of friendship, bravery, and hope in the face of overwhelming odds.",
                         posterPath: UIImage(named: <#T##String#>),
                         bookContents: ["In the heart of a dense forest, nestled between towering trees and winding streams, stood a grand oak that was said to be older than time itself. This tree was known throughout the forest as the Guardian, for it was believed to possess wisdom and powers that protected the entire woodland. Its gnarled branches stretched wide, forming a canopy that provided shelter to all the creatures below. \nEvery spring, when the forest was at its most vibrant, a unique ritual took place. The animals would gather at the base of the Guardian to listen to its stories. This was the only time the ancient oak spoke, and it was a revered event. The birds would perch on its branches, the deer and rabbits would sit at its roots, and even the foxes and wolves would come, setting aside their differences for this special occasion.\nOne year, as the forest awakened from its winter slumber, the animals noticed something unusual. The Guardian's leaves were not as green as they once were, and its branches seemed to sag. A sense of unease spread through the forest. Without the Guardian, who would protect them? \nA young squirrel named Pippin took it upon himself to find out what was wrong. Pippin was known for his curiosity and daring, often venturing where others dared not. He climbed up the Guardian's trunk, leaping from branch to branch until he reached the highest point. There, he found a gaping wound in the bark, oozing with a strange, dark sap. \nPippin quickly descended and shared his discovery with the other animals. The wise old owl, Archimedes, suggested they consult the forest's oldest resident, a tortoise named Eldric, who had lived in the forest for over a century. Eldric was slow but knowledgeable, and he knew the forest's secrets like no one else. \n When Pippin explained the problem to Eldric, the tortoise's eyes grew wide. \"This is a sign of the Dark Roots,\" he said solemnly. \"An ancient force that seeks to drain the life from the forest. If we don't act quickly, the Guardian will wither, and the forest will fall into chaos.\" \nThe animals were determined to save their Guardian. Eldric instructed them to gather a rare flower known as the Sun's Tear, which grew deep within the forest. Its nectar was said to be the only cure for the Dark Roots. Pippin, accompanied by a brave young fox named Freya and a swift bluebird named Skye, set off on the perilous journey to find the flower. \nTheir adventure took them through treacherous terrain, across rushing rivers, and into the dark heart of the forest. Along the way, they encountered many dangers, including a fierce storm and a den of vipers. But their courage and teamwork saw them through, and they eventually found the Sun's Tear growing in a secluded glen. \nWith the precious flower in hand, the trio raced back to the Guardian. Eldric carefully applied the nectar to the wound, and the change was almost immediate. The dark sap receded, and the leaves regained their vibrant green hue. The Guardian's branches straightened, and the forest breathed a collective sigh of relief. \nThe animals gathered once more at the base of the Guardian to hear its stories. This time, the Guardian spoke of the courage and friendship of Pippin, Freya, and Skye, and how their bravery saved the forest. The tale became a legend, passed down through generations, reminding everyone that even in the darkest of times, there is always hope, and that together, they can overcome any challenge."]
        )
        
        let book2 = Book(title: "Voyage of Discovery: Columbus's Journey Across the Atlantic",
                         overview: "In 1492, Christopher Columbus embarked on a daring voyage across the Atlantic Ocean in search of a westward route to Asia. With three ships and a crew filled with adventurous spirits, he faced turbulent seas and growing dissent among his men. When the Santa Maria's lookout spots a distant light on the horizon, hope is renewed. This is the account of Columbus's journey, his historic discovery of the New World, and the complex legacy he left behind—a tale of courage, exploration, and the beginning of a new era.",
                         posterPath: URL(string:"https://www.icloud.com/iclouddrive/00332_mAG1T8mzGK7gL94HBKw")!,
                         bookContents: ["In the year 1492, Christopher Columbus set sail from the port of Palos de la Frontera in Spain, aiming to find a westward route to Asia. Despite doubts from his contemporaries, Columbus was convinced that by sailing west, he could reach the East Indies and establish new trade routes for Spain. His journey would become one of the most significant voyages in history, leading to the European discovery of the Americas.\nColumbus' expedition consisted of three ships: the Niña, the Pinta, and his flagship, the Santa Maria. The crew was a diverse group of sailors, navigators, and explorers, each with their own reasons for embarking on such a daring journey. Some sought fortune, others adventure, but all shared the excitement of venturing into the unknown.\nThe journey across the Atlantic was filled with challenges. As days turned into weeks, the crew grew restless. Whispers of mutiny spread as doubts about the success of the voyage grew. The vast expanse of the ocean stretched before them, and some began to fear that they would never see land again. Columbus, however, remained resolute, calming the crew's fears with promises of great riches and new lands to explore.\nOn the night of October 11, 1492, Columbus was on the deck of the Santa Maria, scanning the horizon. He knew that they were nearing their destination, and the anticipation was palpable. As the moonlight reflected off the waves, a faint glimmer appeared in the distance. It was a small light, barely visible, but it was enough to spark hope among the crew. Columbus ordered the ships to sail toward it, believing it to be a sign of land.\nBy dawn, they reached the shores of an island in the Bahamas, later named San Salvador. Columbus and his crew were met by the indigenous Taíno people, who greeted them with curiosity and warmth. The explorers marveled at the beauty of the land, with its lush vegetation, crystal-clear waters, and vibrant wildlife.\nColumbus, believing he had reached the East Indies, began to explore the surrounding islands, documenting the people, flora, and fauna. He established relationships with the Taíno, learning about their customs and culture. However, his intentions were not entirely benign. As he claimed these lands for Spain, he also envisioned the exploitation of their resources and the subjugation of the indigenous people.\nThe return journey to Spain was triumphant. Columbus brought back tales of new lands, exotic goods, and the promise of future wealth. He was hailed as a hero, and his voyage paved the way for further exploration and colonization. However, the impact on the indigenous people would be profound, leading to the disruption of their societies and the beginning of a long and often tragic history.\nColumbus' legacy is complex. His voyage marked the beginning of an era of exploration that would shape the course of history, but it also brought with it the seeds of conquest and colonization. The story of his journey is a reminder of the boldness of exploration, but also a cautionary tale about the consequences of encountering new worlds without understanding or respecting their cultures."]
        )
        
        let book3 = Book(title: "Rekindling the Flame",
                         overview: "In a quiet Scottish Highland village, Alistair, a reclusive craftsman, finds his world turned upside down when a storm brings an unexpected visitor to his doorstep. Isla, a young traveler lost in the storm, seeks shelter, bringing with her a spark of life that reignites Alistair's long-buried dreams. As the storm rages outside, their stories unfold, revealing past tragedies and the possibility of new beginnings. Through shared memories, laughter, and companionship, Alistair discovers that it's never too late to open one's heart and embrace the world. \"Rekindling the Flame\" is a touching story of loss, healing, and the courage to move forward.",
                         posterPath: URL(string: "https://www.icloud.com/iclouddrive/094sXcXXwzszV7oh22s50w36A")!,
                         bookContents: ["In a remote village in the Scottish Highlands, nestled among ancient stone cottages and rolling green hills, lived a man named Alistair. He was a solitary soul, known for his reclusive nature and his work as a craftsman. His hands were skilled, shaping wood into intricate carvings that adorned the homes of the villagers. Yet, for all his talent, Alistair kept to himself, preferring the quiet of his workshop to the bustle of the village.\nThe villagers spoke in hushed tones about Alistair's past. They said he had once been a vibrant young man with dreams of traveling the world. But a tragic event had changed him, turning him into the hermit he now was. The only time he ventured into the village was to sell his carvings at the market, and even then, he spoke little, his eyes avoiding contact with anyone.\nOne evening, as a storm rolled in from the sea, Alistair heard a knock at his door. It was a rare occurrence, and he was reluctant to open it, but the urgency in the knocking compelled him to answer. On his doorstep stood a young woman, drenched from the rain, her hair tangled and her clothes soaked through. She was shivering, and her eyes held a look of desperation.\n \"Please, sir,\" she said, her voice trembling. \"I need shelter from the storm.\"\nAlistair hesitated, but the sight of her vulnerability stirred something within him. He stepped aside, allowing her to enter his small cottage. He quickly stoked the fire, offering her a warm blanket and a cup of hot tea. The woman introduced herself as Isla, a traveler who had lost her way in the storm. As they sat by the fire, she spoke of her journey, her dreams of seeing the world, and the stories she had heard from her grandmother about the Highlands.\nAlistair listened intently, his heart opening in a way it hadn't in years. Her words brought back memories of his own dreams, dreams that had been shattered long ago. He shared with her the story of his lost love, a woman named Catriona, who had died in a tragic accident. Her death had broken him, leaving him with a deep sense of loss that he had never truly healed from.\nIsla's eyes softened as she listened to his story. \"I'm so sorry for your loss,\" she said. \"But you don't have to live in the past. The world is still out there, waiting for you.\"\nOver the next few days, as the storm raged outside, Alistair and Isla grew closer. They shared stories, laughter, and a sense of companionship that neither had felt in a long time. Alistair showed her his carvings, and she marveled at the beauty of his work. He began to see the world through her eyes, a world filled with possibility and hope.\nWhen the storm finally cleared, Isla prepared to continue her journey. She thanked Alistair for his kindness and invited him to join her on her travels. Alistair was hesitant, the fear of the unknown holding him back. But Isla's presence had rekindled something within him, a spark of courage that he thought was long gone.\nAs she walked toward the village, Alistair watched her from his doorway. The wind had calmed, and the sun was breaking through the clouds. He took a deep breath, feeling the weight of his grief lifting. With a newfound sense of determination, he grabbed his coat and set out after her, ready to embrace the world once more."])
        
        return [book1, book2, book3]
    }
    

}

