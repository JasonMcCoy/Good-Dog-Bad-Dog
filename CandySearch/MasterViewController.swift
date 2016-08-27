/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class MasterViewController: UITableViewController {
  
  // MARK: - Properties
  var detailViewController: DetailViewController? = nil
  var foodz = [DogFood]()
  var filteredFoodz = [DogFood]()
  let searchController = UISearchController(searchResultsController: nil)
  
  // MARK: - View Setup
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the Search Controller
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    definesPresentationContext = true
    searchController.dimsBackgroundDuringPresentation = false
    
    // Setup the Scope Bar
    searchController.searchBar.scopeButtonTitles = ["All", "Bad for Dogs", "Good for Dogs"]
    tableView.tableHeaderView = searchController.searchBar
    
    // Manage all the different objects for your users to search.
    foodz = [
        // Can cause intoxication, seizures, low blood sugar, arrhythmias,coma, and death.
        DogFood(category:"Bad for Dogs", name:"Alcoholic beverages"),
        // The leaves, seeds, fruit, and bark contain persin, which can cause vomiting and diarrhea.
        DogFood(category:"Bad for Dogs", name:"Avocado"),
        // Can cause obstruction or laceration of the digestive system.
        DogFood(category:"Bad for Dogs", name:"Bones from fish"),
        // Can cause obstruction or laceration of the digestive system.
        DogFood(category:"Bad for Dogs", name:"Bad for Dogs Bar"),
        // Can cause obstruction or laceration of the digestive system.
        DogFood(category:"Bad for Dogs", name:"Poultry"),
        // Generally too high in protein and fats.
        DogFood(category:"Bad for Dogs", name:"Cat food"),
        // Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems.
        DogFood(category:"Bad for Dogs", name:"Chocolate"),
        // Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems.
        DogFood(category:"Bad for Dogs", name:"Coffee"),
        // Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems.
        DogFood(category:"Bad for Dogs", name:"Tea"),
        // Can cause vomiting.
        DogFood(category:"Bad for Dogs", name:"Citrus oil extracts"),
        // Can cause pancreatitis.
        DogFood(category:"Bad for Dogs", name:"Fat trimmings"),
        // If fed exclusively or in high amounts can result in a thiamine (a B vitamin) deficiency leading to loss of appetite, seizures, and in severe cases, death.
        DogFood(category:"Bad for Dogs", name:"Fish (raw, canned or cooked)"),
        // Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract.
        DogFood(category:"Bad for Dogs", name:"Grapes, raisins and currants"),
        // Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract.
        DogFood(category:"Bad for Dogs", name:"Raisins"),
        // Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract.
        DogFood(category:"Bad for Dogs", name:"Currants"),
        // Unknown compound causes panting, increased heart rate, elevated temperature, seizures, and death.
        DogFood(category:"Bad for Dogs", name:"Hops"),
        // Can damage the lining of the digestive system and be toxic to the other organs including the liver and kidneys.
        DogFood(category:"Bad for Dogs", name:"Human vitamin supplements containing iron"),
        // Contain an unknown toxin, which can affect the digestive and nervous systems and muscle.
        DogFood(category:"Bad for Dogs", name:"Macadamia nuts"),
        // Can depress the nervous system, cause vomiting, and changes in the heart rate.
        DogFood(category:"Bad for Dogs", name:"Marijuana"),
        // Some adult dogs and cats may develop diarrhea if given large amounts of dairy products.
        DogFood(category:"Bad for Dogs", name:"Milk"),
        // Some adult dogs and cats may develop diarrhea if given large amounts of dairy products.
        DogFood(category:"Bad for Dogs", name:"Dairy products"),
        // Can contain multiple toxins causing vomiting and diarrhea and can also affect other organs.
        DogFood(category:"Bad for Dogs", name:"Moldy or spoiled food"),
        // Can contain toxins, which may affect multiple systems in the body, cause shock, and result in death.
        DogFood(category:"Bad for Dogs", name:"Mushrooms"),
        // Contain sulfoxides and disulfides, which can damage red blood cells and cause anemia. Cats are more susceptible than dogs.
        DogFood(category:"Bad for Dogs", name:"Onions (raw, cooked, or powder)"),
        // Contain sulfoxides and disulfides, which can damage red blood cells and cause anemia. Cats are more susceptible than dogs.
        DogFood(category:"Bad for Dogs", name:"Garlic (raw, cooked, or powder)"),
        // Seeds can cause intestinal obstruction and enteritis.
        DogFood(category:"Bad for Dogs", name:"Persimmons"),
        // Can cause obstruction of the digestive tract.
        DogFood(category:"Bad for Dogs", name:"Pits (from peaches and plums)"),
        // Contain an enzyme called avidin, which decreases the absorption ofbiotin (a B vitamin). This can lead to skin and hair coat problems as well as neurologic abnormalities. Raw eggs may also contains Salmonella.
        DogFood(category:"Bad for Dogs", name:"Raw eggs"),
        // May contain bacteria such as Salmonella and E. coli, which can cause vomiting and diarrhea.
        DogFood(category:"Bad for Dogs", name:"Raw meat"),
        // Contain oxalates, which can affect the digestive, nervous, and urinary systems.
        DogFood(category:"Bad for Dogs", name:"Rhubarb leaves"),
        // If eaten in large quantities it may lead to electrolyte imbalances, seizures, and even death.
        DogFood(category:"Bad for Dogs", name:"Salt"),
        // Can become trapped in the digestive system; called a "string foreign body."
        DogFood(category:"Bad for Dogs", name:"String"),
        // Can lead to obesity, dental problems, and possibly diabetes mellitus.
        DogFood(category:"Bad for Dogs", name:"Sugary foods"),
        // Table scraps are not nutritionally balanced. They should never be more than 10% of the diet. Fat should be trimmed from meat; bones should not be fed.
        DogFood(category:"Bad for Dogs", name:"Table food/scraps (in large amounts)"),
        // Contains nicotine, which affects the digestive and nervous systems. Can result in rapid heart beat, collapse, coma, and death.
        DogFood(category:"Bad for Dogs", name:"Tobacco"),
        // Can expand and produce gas in the digestive system, causing pain and possible rupture of the stomach or intestines.
        DogFood(category:"Bad for Dogs", name:"Yeast dough"),
        // Can cause very low blood sugar (hypoglycemia), which can result in vomiting, weakness and collapse. In high doses can cause liver failure and death.
        DogFood(category:"Bad for Dogs", name:"Xylitol (artificial sweetener)"),
        // Cinnamon and its oils can irritate the inside of pets’ mouths, making them uncomfortable and sick. It can lower a dog’s blood sugar too much and can lead to diarrhea, vomiting, increased, or decreased heart rate and even liver disease. If they inhale it in powder form, cinnamon can cause difficulty breathing, coughing, and choking.
        DogFood(category:"Bad for Dogs", name:"Cinnamon"),
        // Like cherries, the seeds, leaves and stems of apricot plants are toxic to dogs. While they are able to consume the pulp of the fruit with no ill effects, caution should be taken if your dog has access to any other parts of the plant. These plants also contain cyanide, and can result in respiratory failure and death.
        DogFood(category:"Bad for Dogs", name:"Apricots"),
        // Nutmeg can also be stored in the pantry with other potentially hazardous substances for pets. Often used as a spice for baking, nutmeg's rich, spicy scent is attractive to dogs. High levels can be fatal. Signs include tremors, seizures and nervous system abnormalities.
        DogFood(category:"Bad for Dogs", name:"Nutmeg"),
        // Cat food contains proteins and fats that are targeted at the diet of a cat, not a dog. The protein and fat levels in cat food are too high for your dog, and not healthy.
        DogFood(category:"Bad for Dogs", name:"Baby food"),
        // Gastrointestinal irritant.
        DogFood(category:"Bad for Dogs", name:"Broccoli"),
        // Peanut Butter is one of the best treats to give to dogs because it lasts them so long! Plus, its packed full of protein, healthy fats, niacin, vitamin B and vitamin E.
        DogFood(category:"Good for Dogs", name:"Peanut Butter"),
        // Cooked chicken meat is a perfectly suitable snack or meal additive
        DogFood(category:"Good for Dogs", name:"Chicken"),
        // Carrots are high in fiber and vitamin A while being low in calories.
        DogFood(category:"Good for Dogs", name:"Carrots"),
        // Yogurt is full of protein, calcium and digestive cultures and is an excellent way to improve your pup’s digestive health.
        DogFood(category:"Good for Dogs", name:"Yogurt"),
        // Canned pumpkin or fresh, cooked pumpkin with no added sugars and spices is a great choice for dogs with a sensitive stomach. It’s also an excellent source of vitamin A and fiber.
        DogFood(category:"Good for Dogs", name:"Pumpkin"),
        // Green beans are highly recommended by veterinarians for owners looking to help their dogs loose weight. They are very high in fiber but low in calories, making them a healthy treat alternative that’s filling but won’t add any weight.
        DogFood(category:"Good for Dogs", name:"Green Beans"),
        // Salmon is very high in health omega-3 fatty acids and is typically the fish used to make fish oils for our pets.
        DogFood(category:"Good for Dogs", name:"Salmon"),
        // Sweet potatoes work similarly to pumpkin as they are high in vitamin A, fiber and other nutrients. They are easily digestible when steamed or baked, served unseasoned.
        DogFood(category:"Good for Dogs", name:"Sweet Potatoes"),
        // Sliced apples are a healthy and tasty treat for dogs that are full of phytonutrients, vitamin A and vitamin C. They can be given with the skin on, but avoid feeding the seeds as they naturally contain cyanide.
        DogFood(category:"Good for Dogs", name:"Apples"),
        // Oatmeal is found in many dog foods and for those not sensitive to grains, it can be a healthy additive to your dog’s meal. Not only is it packed with vitamins and minerals, it’s an excellent source of dietary fiber.
        DogFood(category:"Good for Dogs", name:"Oatmeal"),
        // Eggs are a great source of very digestible protein, riboflavin, and selenium. - See more at: http://moderndogmagazine.com/articles/10-people-foods-dogs/1896#sthash.XNuKqmf7.dpuf
        DogFood(category:"Good for Dogs", name:"Eggs"),
        /*//
        DogFood(category:"Bad for Dogs", name:"Caramel"),
        //
        DogFood(category:"Bad for Dogs", name:"Sour Chew"),
        //
        DogFood(category:"Bad for Dogs", name:"Gummi Bear"),
        //
        DogFood(category:"Bad for Dogs", name:"Bad for Dogs Bar"),
        //
        DogFood(category:"Bad for Dogs", name:"Bad for Dogs Chip"),
        //
        DogFood(category:"Bad for Dogs", name:"Dark Bad for Dogs"),
        //
        DogFood(category:"Bad for Dogs", name:"Lollipop"),
        //
        DogFood(category:"Bad for Dogs", name:"DogFood Cane"),
        //
        DogFood(category:"Bad for Dogs", name:"Jaw Breaker"),
        //
        DogFood(category:"Bad for Dogs", name:"Caramel"),
        //
        DogFood(category:"Bad for Dogs", name:"Sour Chew"),
        //
        DogFood(category:"Bad for Dogs", name:"Gummi Bear"),
        //
        DogFood(category:"Bad for Dogs", name:"Bad for Dogs Bar"),
        //
        DogFood(category:"Bad for Dogs", name:"Bad for Dogs Chip"),
        //
        DogFood(category:"Bad for Dogs", name:"Dark Bad for Dogs"),
        //
        DogFood(category:"Bad for Dogs", name:"Lollipop"),
        //
        DogFood(category:"Bad for Dogs", name:"DogFood Cane") */
              ]
    
    if let splitViewController = splitViewController {
      let controllers = splitViewController.viewControllers
      detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table View
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.isActive && searchController.searchBar.text != "" {
      return filteredFoodz.count
    }
    return foodz.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let DogFood: DogFood
    if searchController.isActive && searchController.searchBar.text != "" {
      DogFood = filteredFoodz[(indexPath as NSIndexPath).row]
    } else {
      DogFood = foodz[(indexPath as NSIndexPath).row]
    }
    cell.textLabel!.text = DogFood.name
    cell.detailTextLabel!.text = DogFood.category
    return cell
  }
  
  func filterContentForSearchText(_ searchText: String, scope: String = "All") {
    filteredFoodz = foodz.filter({( DogFood : DogFood) -> Bool in
      let categoryMatch = (scope == "All") || (DogFood.category == scope)
      return categoryMatch && DogFood.name.lowercased().contains(searchText.lowercased())
    })
    tableView.reloadData()
  }
  
  // MARK: - Segues
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showDetail" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let DogFood: DogFood
        if searchController.isActive && searchController.searchBar.text != "" {
          DogFood = filteredFoodz[(indexPath as NSIndexPath).row]
        } else {
          DogFood = foodz[(indexPath as NSIndexPath).row]
        }
        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
        controller.detailCandy = DogFood
        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        controller.navigationItem.leftItemsSupplementBackButton = true
      }
    }
  }
  
}

extension MasterViewController: UISearchBarDelegate {
  // MARK: - UISearchBar Delegate
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
}

extension MasterViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!, scope: scope)
  }
}
