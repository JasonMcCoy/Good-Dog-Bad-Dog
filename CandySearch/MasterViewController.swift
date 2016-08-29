/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense and/or sell
* copies of the Software and to permit persons to whom the Software is
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
        // Can cause intoxication, seizures, low blood sugar, arrhythmias,coma and death.
        DogFood(category: "Bad for Dogs", name: "Alcoholic beverages", description: "Can cause intoxication, seizures, low blood sugar, arrhythmias,coma and death."),
        // The leaves, seeds, fruit and bark contain persin, which can cause vomiting and diarrhea.
        DogFood(category: "Bad for Dogs", name: "Avocado", description: "The leaves, seeds, fruit and bark contain persin, which can cause vomiting and diarrhea."),
        // Can cause obstruction or laceration of the digestive system.
        DogFood(category: "Bad for Dogs", name: "Bones from fish", description: "Can cause obstruction or laceration of the digestive system."),
        // Can cause obstruction or laceration of the digestive system.
        DogFood(category: "Bad for Dogs", name: "Candy bar", description: "Can cause obstruction or laceration of the digestive system."),
        // Can cause obstruction or laceration of the digestive system.
        DogFood(category: "Bad for Dogs", name: "Poultry", description: "Can cause obstruction or laceration of the digestive system."),
        // Generally too high in protein and fats.
        DogFood(category: "Bad for Dogs", name: "Cat food", description: "Generally too high in protein and fats."),
        // Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems.
        DogFood(category: "Bad for Dogs", name: "Chocolate", description: "Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems."),
        // Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems.
        DogFood(category: "Bad for Dogs", name: "Coffee", description: "Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems."),
        // Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems.
        DogFood(category: "Bad for Dogs", name: "Tea", description: "Contain caffeine, theobromine, or theophylline, which can cause vomiting and diarrhea and be toxic to the heart and nervous systems."),
        // Can cause vomiting.
        DogFood(category: "Bad for Dogs", name: "Citrus oil extracts", description: "Can cause vomiting."),
        // Can cause pancreatitis.
        DogFood(category: "Bad for Dogs", name: "Fat trimmings", description: "Can cause pancreatitis."),
        // If fed exclusively or in high amounts can result in a thiamine (a B vitamin) deficiency leading to loss of appetite, seizures and in severe cases, death.
        DogFood(category: "Bad for Dogs", name: "Fish", description: "Raw, canned or cooked, if fed exclusively or in high amounts can result in a thiamine (a B vitamin) deficiency leading to loss of appetite, seizures and in severe cases, death."),
        // Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract.
        DogFood(category: "Bad for Dogs", name: "Grapes", description: "Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract."),
        // Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract.
        DogFood(category: "Bad for Dogs", name: "Raisins", description: "Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract."),
        // Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract.
        DogFood(category: "Bad for Dogs", name: "Currants", description: "Contain an unknown toxin, which can damage the kidneys. There have been no problems associated with grape seed extract."),
        // Unknown compound causes panting, increased heart rate, elevated temperature, seizures and death.
        DogFood(category: "Bad for Dogs", name: "Hops", description: "Unknown compound causes panting, increased heart rate, elevated temperature, seizures and death."),
        // Can damage the lining of the digestive system and be toxic to the other organs including the liver and kidneys.
        DogFood(category: "Bad for Dogs", name: "Human vitamin supplements", description: "Can damage the lining of the digestive system and be toxic to the other organs including the liver and kidneys if it contains iron."),
        // Contain an unknown toxin, which can affect the digestive and nervous systems and muscle.
        DogFood(category: "Bad for Dogs", name: "Macadamia nuts", description: "Contain an unknown toxin, which can affect the digestive and nervous systems and muscle."),
        // Can depress the nervous system, cause vomiting and changes in the heart rate.
        DogFood(category: "Bad for Dogs", name: "Marijuana", description: "Can depress the nervous system, cause vomiting and changes in the heart rate."),
        // Some adult dogs and cats may develop diarrhea if given large amounts of dairy products.
        DogFood(category: "Bad for Dogs", name: "Milk", description: "Some adult dogs and cats may develop diarrhea if given large amounts of dairy products."),
        // Some adult dogs and cats may develop diarrhea if given large amounts of dairy products.
        DogFood(category: "Bad for Dogs", name: "Dairy products", description: "Some adult dogs and cats may develop diarrhea if given large amounts of dairy products."),
        // Can contain multiple toxins causing vomiting and diarrhea and can also affect other organs.
        DogFood(category: "Bad for Dogs", name: "Moldy or spoiled foods", description: "Can contain multiple toxins causing vomiting and diarrhea and can also affect other organs."),
        // Can contain toxins, which may affect multiple systems in the body, cause shock and result in death.
        DogFood(category: "Bad for Dogs", name: "Mushrooms", description: "Can contain toxins, which may affect multiple systems in the body, cause shock and result in death."),
        // Contain sulfoxides and disulfides, which can damage red blood cells and cause anemia. Cats are more susceptible than dogs.
        DogFood(category: "Bad for Dogs", name: "Onions", description: "Raw, cooked, or powdered may contain sulfoxides and disulfides, which can damage red blood cells and cause anemia."),
        // Contain sulfoxides and disulfides, which can damage red blood cells and cause anemia. Cats are more susceptible than dogs.
        DogFood(category: "Bad for Dogs", name: "Garlic", description: "Raw, cooked, or powdered may contain sulfoxides and disulfides, which can damage red blood cells and cause anemia. Cats are more susceptible than dogs."),
        // Seeds can cause intestinal obstruction and enteritis.
        DogFood(category: "Bad for Dogs", name: "Persimmons", description: "Seeds can cause intestinal obstruction and enteritis."),
        // Can cause obstruction of the digestive tract.
        DogFood(category: "Bad for Dogs", name: "Pits", description: "Can cause obstruction of the digestive tract."),
        // Contain an enzyme called avidin, which decreases the absorption ofbiotin (a B vitamin). This can lead to skin and hair coat problems as well as neurologic abnormalities. Raw eggs may also contains Salmonella.
        DogFood(category: "Bad for Dogs", name: "Raw eggs", description: "Contain an enzyme called avidin, which decreases the absorption ofbiotin (a B vitamin). This can lead to skin and hair coat problems as well as neurologic abnormalities. Raw eggs may also contains Salmonella."),
        // May contain bacteria such as Salmonella and E. coli, which can cause vomiting and diarrhea.
        DogFood(category: "Bad for Dogs", name: "Raw meat", description: "May contain bacteria such as Salmonella and E. coli, which can cause vomiting and diarrhea."),
        // Contain oxalates, which can affect the digestive, nervous and urinary systems.
        DogFood(category: "Bad for Dogs", name: "Rhubarb leaves", description: "Contain oxalates, which can affect the digestive, nervous and urinary systems."),
        // If eaten in large quantities it may lead to electrolyte imbalances, seizures and even death.
        DogFood(category: "Bad for Dogs", name: "Salt", description: "If eaten in large quantities it may lead to electrolyte imbalances, seizures and even death."),
        // Can lead to obesity, dental problems and possibly diabetes mellitus.
        DogFood(category: "Bad for Dogs", name: "Sugary foods", description: "Can lead to obesity, dental problems and possibly diabetes mellitus."),
        // Table scraps are not nutritionally balanced. They should never be more than 10% of the diet. Fat should be trimmed from meat; bones should not be fed.
        DogFood(category: "Bad for Dogs", name: "Leftovers", description: "Table scraps are not nutritionally balanced. They should never be more than 10% of the diet. Fat should be trimmed from meat; bones should not be fed."),
        // Contains nicotine, which affects the digestive and nervous systems. Can result in rapid heart beat, collapse, coma and death.
        DogFood(category: "Bad for Dogs", name: "Tobacco", description: "Contains nicotine, which affects the digestive and nervous systems. Can result in rapid heart beat, collapse, coma and death."),
        // Can expand and produce gas in the digestive system, causing pain and possible rupture of the stomach or intestines.
        DogFood(category: "Bad for Dogs", name: "Yeast dough", description: "Can expand and produce gas in the digestive system, causing pain and possible rupture of the stomach or intestines."),
        // Can cause very low blood sugar (hypoglycemia), which can result in vomiting, weakness and collapse. In high doses can cause liver failure and death.
        DogFood(category: "Bad for Dogs", name: "Xylitol (artificial sweetener)", description: "Can cause very low blood sugar (hypoglycemia), which can result in vomiting, weakness and collapse. In high doses can cause liver failure and death."),
        // Cinnamon and its oils can irritate the inside of pets’ mouths, making them uncomfortable and sick. It can lower a dog’s blood sugar too much and can lead to diarrhea, vomiting, increased, or decreased heart rate and even liver disease. If they inhale it in powder form, cinnamon can cause difficulty breathing, coughing and choking.
        DogFood(category: "Bad for Dogs", name: "Cinnamon", description: "Cinnamon and its oils can irritate the inside of pets’ mouths, making them uncomfortable and sick. It can lower a dog’s blood sugar too much and can lead to diarrhea, vomiting, increased, or decreased heart rate and even liver disease. If they inhale it in powder form, cinnamon can cause difficulty breathing, coughing and choking."),
        // Like cherries, the seeds, leaves and stems of apricot plants are toxic to dogs. While they are able to consume the pulp of the fruit with no ill effects, caution should be taken if your dog has access to any other parts of the plant. These plants also contain cyanide and can result in respiratory failure and death.
        DogFood(category: "Bad for Dogs", name: "Apricots", description: "Like cherries, the seeds, leaves and stems of apricot plants are toxic to dogs. While they are able to consume the pulp of the fruit with no ill effects, caution should be taken if your dog has access to any other parts of the plant. These plants also contain cyanide and can result in respiratory failure and death."),
        // Nutmeg can also be stored in the pantry with other potentially hazardous substances for pets. Often used as a spice for baking, nutmeg's rich, spicy scent is attractive to dogs. High levels can be fatal. Signs include tremors, seizures and nervous system abnormalities.
        DogFood(category: "Bad for Dogs", name: "Nutmeg", description: "Nutmeg can also be stored in the pantry with other potentially hazardous substances for pets. Often used as a spice for baking, nutmeg's rich, spicy scent is attractive to dogs. High levels can be fatal. Signs include tremors, seizures and nervous system abnormalities."),
        // Cat food contains proteins and fats that are targeted at the diet of a cat, not a dog. The protein and fat levels in cat food are too high for your dog and not healthy.
        DogFood(category: "Bad for Dogs", name: "Baby food", description: "Cat food contains proteins and fats that are targeted at the diet of a cat, not a dog. The protein and fat levels in cat food are too high for your dog and not healthy."),
        // Gastrointestinal irritant.
        DogFood(category: "Bad for Dogs", name: "Broccoli", description: "Gastrointestinal irritant."),
        // Peanut Butter is one of the best treats to give to dogs because it lasts them so long! Plus, its packed full of protein, healthy fats, niacin, vitamin B and vitamin E.
        DogFood(category: "Good for Dogs", name: "Peanut butter", description: "Peanut Butter is one of the best treats to give to dogs because it lasts them so long! Plus, its packed full of protein, healthy fats, niacin, vitamin B and vitamin E."),
        // Cooked chicken meat is a perfectly suitable snack or meal additive.
        DogFood(category: "Good for Dogs", name: "Chicken", description: "Cooked chicken meat is a perfectly suitable snack or meal additive."),
        // Carrots are high in fiber and vitamin A while being low in calories.
        DogFood(category: "Good for Dogs", name: "Carrots", description: "Carrots are high in fiber and vitamin A while being low in calories."),
        // Yogurt is full of protein, calcium and digestive cultures and is an excellent way to improve your pup’s digestive health.
        DogFood(category: "Good for Dogs", name: "Yogurt", description: "Yogurt is full of protein, calcium and digestive cultures and is an excellent way to improve your pup’s digestive health."),
        // Canned pumpkin or fresh, cooked pumpkin with no added sugars and spices is a great choice for dogs with a sensitive stomach. It’s also an excellent source of vitamin A and fiber.
        DogFood(category: "Good for Dogs", name: "Pumpkin", description: "Canned pumpkin or fresh, cooked pumpkin with no added sugars and spices is a great choice for dogs with a sensitive stomach. It’s also an excellent source of vitamin A and fiber."),
        // Green beans are highly recommended by veterinarians for owners looking to help their dogs loose weight. They are very high in fiber but low in calories, making them a healthy treat alternative that’s filling but won’t add any weight.
        DogFood(category: "Good for Dogs", name: "Green beans", description: "Green beans are highly recommended by veterinarians for owners looking to help their dogs loose weight. They are very high in fiber but low in calories, making them a healthy treat alternative that’s filling but won’t add any weight."),
        // Salmon is very high in health omega-3 fatty acids and is typically the fish used to make fish oils for our pets.
        DogFood(category: "Good for Dogs", name: "Salmon", description: "Very high in health omega-3 fatty acids and is typically the fish used to make fish oils for our pets."),
        // Sweet potatoes work similarly to pumpkin as they are high in vitamin A, fiber and other nutrients. They are easily digestible when steamed or baked, served unseasoned.
        DogFood(category: "Good for Dogs", name: "Sweet potatoes", description: "Sweet potatoes work similarly to pumpkin as they are high in vitamin A, fiber and other nutrients. They are easily digestible when steamed or baked, served unseasoned."),
        // Sliced apples are a healthy and tasty treat for dogs that are full of phytonutrients, vitamin A and vitamin C. They can be given with the skin on, but avoid feeding the seeds as they naturally contain cyanide.
        DogFood(category: "Good for Dogs", name: "Apples", description: "Sliced apples are a healthy and tasty treat for dogs that are full of phytonutrients, vitamin A and vitamin C. They can be given with the skin on, but avoid feeding the seeds as they naturally contain cyanide."),
        // Oatmeal is found in many dog foods and for those not sensitive to grains, it can be a healthy additive to your dog’s meal. Not only is it packed with vitamins and minerals, it’s an excellent source of dietary fiber.
        DogFood(category: "Good for Dogs", name: "Oatmeal", description: "Oatmeal is found in many dog foods and for those not sensitive to grains, it can be a healthy additive to your dog’s meal. Not only is it packed with vitamins and minerals, it’s an excellent source of dietary fiber."),
        //  Most crackers contain a lot of added for taste. They’re higher in sodium than many other foods. For a dog, they are going to be really high in sodium. Remember, the nutritional facts you see printed on the box are calculated for us, not dogs.
        DogFood(category: "Bad for Dogs", name: "Crackers", description: "Most crackers contain a lot of added for taste. They’re higher in sodium than many other foods. For a dog, they are going to be really high in sodium. Remember, the nutritional facts you see printed on the box are calculated for us, not dogs."),
        //  Cilantro is a leafy herb closely related to Parsely and, in small amounts, it’s unlikely to be dangerous for dogs. You can incorporate some into your dog’s meals on occasion. Unless your pet pooch is allergic to cilantro, there’s no cause for alarm if they do happen to eat some.
        DogFood(category: "Good for Dogs", name: "Cilantro", description: "Cilantro is a leafy herb closely related to Parsely and, in small amounts, it’s unlikely to be dangerous for dogs. You can incorporate some into your dog’s meals on occasion. Unless your pet pooch is allergic to cilantro, there’s no cause for alarm if they do happen to eat some."),
        // You probably shouldn’t be feeding your dog cranberries, for any reason, as this is something that they may have trouble digesting. Cranberry juice may, in fact, alter the amount of bacteria in your dog’s bladder and/or the entire urinary tract system, but it is likely not a fix.
        DogFood(category: "Bad for Dogs", name: "Cranberries", description: "You probably shouldn’t be feeding your dog cranberries, for any reason, as this is something that they may have trouble digesting. Cranberry juice may, in fact, alter the amount of bacteria in your dog’s bladder and/or the entire urinary tract system, but it is likely not a fix."),
        // Canines certainly require meat, but this particular kind is likely too rich. Ham could easily add too much sodium in your dog’s diet.
        DogFood(category: "Bad for Dogs", name: "Ham", description: "Canines certainly require meat, but this particular kind is likely too rich. Ham could easily add too much sodium in your dog’s diet."),
        // Dogs with or without lactose intolerance, don’t need anything but fresh water in their bowls. Most dogs are not lactose intolerant, and the ones that are are mostly just sensitive to lactose. It’s very rare to find a dog that can’t handle a little bit of milk and dairy products without an upset stomach.
        DogFood(category: "Bad for Dogs", name: "Milk (lactose free)", description: "Dogs with or without lactose intolerance, don’t need anything but fresh water in their bowls. Most dogs are not lactose intolerant, and the ones that are are mostly just sensitive to lactose. It’s very rare to find a dog that can’t handle a little bit of milk and dairy products without an upset stomach."),
        // Beets aren’t known to cause problems for dogs. Regardless, the reason why you don’t need to give your dog beets is that it really won’t do anything for them.
        DogFood(category: "Bad for Dogs", name: "Beets", description: "Beets aren’t known to cause problems for dogs. Regardless, the reason why you don’t need to give your dog beets is that it really won’t do anything for them."),
        // There are no health benefits to a dog eating a jalapeno pepper. On the other hand, there’s reason to believe that hot jalapenos may cause your dog to have gastrointestinal issues down the road.
        DogFood(category: "Bad for Dogs", name: "Jalapeno", description: "There are no health benefits to a dog eating a jalapeno pepper. On the other hand, there’s reason to believe that hot jalapenos may cause your dog to have gastrointestinal issues down the road."),
        //  Most pepperoni has a spicy flavor that could, at the very least, cause your dog to have an stomach upset. The spicier it is, the more upsetting it’s likely to be and gastric issues are very possible. Pepperoni is typically made with fennel seeds, mustard seeds, black pepper, garlic powder and/or paprika. So this common  topping is very highly seasoned and processed which is cause for concern.
        DogFood(category: "Bad for Dogs", name: "Pepperoni", description: "Most pepperoni has a spicy flavor that could, at the very least, cause your dog to have an stomach upset. The spicier it is, the more upsetting it’s likely to be and gastric issues are very possible. Pepperoni is typically made with fennel seeds, mustard seeds, black pepper, garlic powder and/or paprika. So this common  topping is very highly seasoned and processed which is cause for concern."),
        // Marshmallows consist of sugar, more sugar, gelatin, and some artificial flavors and colors. There’s nothing natural about them, including the sugar that’s used. You will likely see a case of diarrhea and perhaps some vomiting if they’re not able to process all of that sugar all at once.
        DogFood(category: "Bad for Dogs", name: "Marshmallow", description: "Marshmallows consist of sugar, more sugar, gelatin, and some artificial flavors and colors. There’s nothing natural about them, including the sugar that’s used. You will likely see a case of diarrhea and perhaps some vomiting if they’re not able to process all of that sugar all at once."),
        // There’s no need to give them kale but you can provide small portions on occasion. It won’t do any harm.
        DogFood(category: "Good for Dogs", name: "Kale", description: "There’s no need to give them kale, but you can provide small portions on occasion. It won’t do any harm. "),
        // If your dog can tolerate shrimp, it can be a nutritious treat. Often overlooked, they contain selenium which is a great antioxidant. This ocean critter has two different types of antioxidants which means there are potential health benefits. Phosphorous and vitamin-B12 are also plentiful in shrimp. At the same time, it’s low in calories, carbs and fat.
        DogFood(category: "Good for Dogs", name: "Shrimp", description: "If your dog can tolerate shrimp, it can be a nutritious treat. Often overlooked, they contain selenium which is a great antioxidant. This ocean critter has two different types of antioxidants which means there are potential health benefits. Phosphorous and vitamin-B12 are also plentiful in shrimp. At the same time, it’s low in calories, carbs and fat."),
        // Although they aren’t likely to be toxic since the wafers don’t contain enough chocolate to cause harm. Of course, there’s always a chance of an adverse reaction. Regardless, Oreos aren’t a good option for your dog. There’s no nutritional value whatsoever. On the contrary, these processed cookies are loaded with artificial ingredients which will make your best buddy overweight and sluggish over time.
        DogFood(category: "Bad for Dogs", name: "Oreos", description: "Although they aren’t likely to be toxic since the wafers don’t contain enough chocolate to cause harm. Of course, there’s always a chance of an adverse reaction. Regardless, Oreos aren’t a good option for your dog. There’s no nutritional value whatsoever. They are loaded with artificial ingredients which will make your best buddy overweight and sluggish over time."),
        // Giving your dog fermented foods is questionable, though not necessarily harmful. You can most likely give your dog a jarred pickle without incident. Just keep it to a minimum and cut it up so there’s no way they can choke on it.
        DogFood(category: "Good for Dogs", name: "Pickles", description: "Giving your dog fermented foods is questionable, though not necessarily harmful. You can most likely give your dog a jarred pickle without incident. Just keep it to a minimum and cut it up so there’s no way they can choke on it."),
        // So the final verdict is that while your dog doesn’t necessarily need squash, it is well tolerated and not something that you’ll be cleaning up later if you give it to them cooked.
        DogFood(category: "Good for Dogs", name: "Squash", description: "So the final verdict is that while your dog doesn’t necessarily need squash, it is well tolerated and not something that you’ll be cleaning up later if you give it to them cooked."),
        // There are many ingredients used in most curry recipes in addition to the spices. This means that there is a chance the curry could include other foods that aren’t good for your dog to consume. The general rule we like to follow is that if it isn’t doing your dog any good, why feed it to them? Dogs aren’t going to savor the robust flavors in the curry, and their stomach might get upset by it, so it’s best to just avoid it entirely.
        DogFood(category: "Bad for Dogs", name: "Curry", description: "There are many ingredients used in most curry recipes in addition to the spices. This means that there is a chance the curry could include other foods that aren’t good for your dog to consume. The general rule we like to follow is that if it isn’t doing your dog any good, why feed it to them? Dogs aren’t going to savor the robust flavors in the curry, and their stomach might get upset by it, so it’s best to just avoid it entirely."),
        // There’s nothing harmful about sharing a bit of your blackberries with Fido. When you get down to the basic question of whether or not a dog should be given blackberries, all that needs to happen is to consider whether they would be eating blackberries if left alone in the wild.
        
        
        
        
        // NEED IMAGES FOR THE FOLLOWING FOODS BELOW
        DogFood(category: "Good for Dogs", name: "Blackberries", description: "There’s nothing harmful about sharing a bit of your blackberries with Fido. When you get down to the basic question of whether or not a dog should be given blackberries, all that needs to happen is to consider whether they would be eating blackberries if left alone in the wild."),
        // The spices and the multitude of ingredients make it a no go for dogs. When you start mixing so many ingredients together, you increase the likelihood that a dog would have an adverse reaction to it, up to an including indigestion, diarrhea and vomiting.
        DogFood(category: "Bad for Dogs", name: "Taco", description: "The spices and the multitude of ingredients make it a no go for dogs. When you start mixing so many ingredients together, you increase the likelihood that a dog would have an adverse reaction to it, up to an including indigestion, diarrhea and vomiting."),
        // Hot sauce is inappropriate for pets. Often these spicy concoctions contain chili which is, needless to say, a highly unusual food for a dog to be eating. Consider all the unhealthy chemicals that go into making a bottle of hot sauce.
        DogFood(category: "Bad for Dogs", name: "Hot sauce", description: "Hot sauce is inappropriate for pets. Often these spicy concoctions contain chili which is, needless to say, a highly unusual food for a dog to be eating. Consider all the unhealthy chemicals that go into making a bottle of hot sauce."),
        // They aren’t healthy for dogs and are best avoided. Dogs should be consuming processed foods such as tortillas. Over time feeding this could cause a whole plethora of digestive problems, not to mention they can’t provide sufficient nutrition.
        DogFood(category: "Bad for Dogs", name: "Tortillas", description: "They aren’t healthy for dogs and are best avoided. Dogs should be consuming processed foods such as tortillas. Over time feeding this could cause a whole plethora of digestive problems, not to mention they can’t provide sufficient nutrition."),
        // Not only is it safe for dogs but it’s rich in fiber and is known to help with gastrointestinal issues, such as bloating and flatulence. Just be sure to remove the seeds and peel away the air exposed outside, in the same way anyone would normally consume it.
        DogFood(category: "Good for Dogs", name: "Papaya", description: "Not only is it safe for dogs but it’s rich in fiber and is known to help with gastrointestinal issues, such as bloating and flatulence. Just be sure to remove the seeds and peel away the air exposed outside, in the same way anyone would normally consume it."),
        // It’s very likely not a suitable protein source for canines and allergies to soy are common. The phytoestrogens found in tofu are probably a net negative for most dogs. Also consider that soy usually contains high levels of pesticides.
        DogFood(category: "Bad for Dogs", name: "Tofu", description: "It’s very likely not a suitable protein source for canines and allergies to soy are common. The phytoestrogens found in tofu are probably a net negative for most dogs. Also consider that soy usually contains high levels of pesticides."),
        // Dogs aren't built to withstand such high levels of salt or artificial chemicals. Excessive salt or sweet artificial flavoring can lead to obesity, heart problems, diarrhea, diabetes and even arthritis. Still worse, dogs can experience organ failure in extreme cases. More commonly, they’ll become lethargic as a result of a poor diet.
        DogFood(category: "Bad for Dogs", name: "Popcorn", description: "Dogs aren't built to withstand such high levels of salt or artificial chemicals. Excessive salt or sweet artificial flavoring can lead to obesity, heart problems, diarrhea, diabetes and even arthritis. Still worse, dogs can experience organ failure in extreme cases. More commonly, they’ll become lethargic as a result of a poor diet."),
        // Pizza contains high amounts of oil, salt and other spices that have the potential for some degree of toxicity. In addition, too much fatty food (especially of the human variety) can contribute to your dog developing pancreatitis over time.
        DogFood(category: "Bad for Dogs", name: "Pizza", description: "Pizza contains high amounts of oil, salt and other spices that have the potential for some degree of toxicity. In addition, too much fatty food (especially of the human variety) can contribute to your dog developing pancreatitis over time."),
        // Sardines are rich in Omega-3 fatty acids, DHA and EPA, which is linked to brain health. This type of fish, and its oils, can also help any dog maintain a great coat and skin. Canines with inflammation, due to allergies or arthritis, may benefit since sardines are known to be a natural way to relieve mild stiffness and improve mobility.
        DogFood(category: "Good for Dogs", name: "Sardines", description: "Sardines are rich in Omega-3 fatty acids, DHA and EPA, which is linked to brain health. This type of fish, and its oils, can also help any dog maintain a great coat and skin. Canines with inflammation, due to allergies or arthritis, may benefit since sardines are known to be a natural way to relieve mild stiffness and improve mobility."),
        // Soda is loaded up with high fructose corn syrup which is responsible for much of the obesity we see today. There are also too many calories for a pet dog to be drinking, and these calories are complete junk!
        DogFood(category: "Bad for Dogs", name: "Soda", description: "Soda is loaded up with high fructose corn syrup which is responsible for much of the obesity we see today. There are also too many calories for a pet dog to be drinking, and these calories are complete junk!"),
        // There have been reports of potassium deficiency and heart problems related to dogs that are only given distilled water. This is because the removed minerals render the water completely devoid of nutrients.
        DogFood(category: "Bad for Dogs", name: "Water (distilled)", description: "There have been reports of potassium deficiency and heart problems related to dogs that are only given distilled water. This is because the removed minerals render the water completely devoid of nutrients."),
        // Yes, you can give your dog a popsicle to hep with hydration. During the hot summer months, sharing a popsicle treat with your pet dog is appropriate and even smart. You probably shouldn’t, however, feed them popsicles just for the heck of it. In any case, it’s better to make your own so you know they can’t be harmful.
        DogFood(category: "Good for Dogs", name: "Popsicles", description: "Yes, you can give your dog a popsicle to hep with hydration. During the hot summer months, sharing a popsicle treat with your pet dog is appropriate and even smart. You probably shouldn’t, however, feed them popsicles just for the heck of it. In any case, it’s better to make your own so you know they can’t be harmful."),
        // Sausage is a bad option for dogs as it may result in minor diarrhea or even vomit from it. Processed with additional unhealthy ingredients, this food is certainly unhealthy for canines as processed meat can easily cause chaos within your dog’s digestive system.
        DogFood(category: "Bad for Dogs", name: "Sausage", description: "Sausage is a bad option for dogs as it may result in minor diarrhea or even vomit from it. Processed with additional unhealthy ingredients, this food is certainly unhealthy for canines as processed meat can easily cause chaos within your dog’s digestive system."),
        // They contain a lot of sugar which is bad for dogs. Sometimes they contain a harmful ingredient called Xylitol. Too much for this leads to possible complications such as diabetes or kidney problems over the long term. Further, your best friend could develop cavities from the sugary contents of mints.
        DogFood(category: "Bad for Dogs", name: "Mint", description: "They contain a lot of sugar which is bad for dogs. Sometimes they contain a harmful ingredient called Xylitol. Too much for this leads to possible complications such as diabetes or kidney problems over the long term. Further, your best friend could develop cavities from the sugary contents of mints."),
        // Melons are particularly good in keeping your dog well hydrated too. As melons are mostly comprised of water, it will keep your dog feeling cool and refreshed. Giving too much melon can lead to your dog having loose stools.
        DogFood(category: "Good for Dogs", name: "Melon", description: "Melons are particularly good in keeping your dog well hydrated too. As melons are mostly comprised of water, it will keep your dog feeling cool and refreshed. Giving too much melon can lead to your dog having loose stools."),
        // Skinny dogs will benefit from the extra minerals and vitamins that Ensure will be able to offer them, ensuring that they have good health no matter how thin they are, it may even help them bulk up. The main side effect that dogs will have from drinking Ensure is diarrhea caused by the lactose in the mix. While the majority of dogs are lactose intolerant, the worst side effect you can expect to see will be diarrhea.
        DogFood(category: "Good for Dogs", name: "Ensure", description: "Skinny dogs will benefit from the extra minerals and vitamins that Ensure will be able to offer them, ensuring that they have good health no matter how thin they are, it may even help them bulk up. The main side effect that dogs will have from drinking Ensure is diarrhea caused by the lactose in the mix. While the majority of dogs are lactose intolerant, the worst side effect you can expect to see will be diarrhea."),
        // French fries tend to be high in the worst kind of fat (saturated and trans) as well as sodium. This is a human food, think of the oil, salt and other undesirable ingredients, that isn’t at all healthy for dogs to be consuming.
        DogFood(category: "Bad for Dogs", name: "French fries", description: "French fries tend to be high in the worst kind of fat (saturated and trans) as well as sodium. This is a human food, think of the oil, salt and other undesirable ingredients, that isn’t at all healthy for dogs to be consuming."),
        // Fiber is easily digested and will help with discomfort. Giving them a higher fiber diet will help them lose the weight and be healthy again. Another benefit is it controls the dog’s sugar levels. If you have a dog that has low sugar levels, you can control it by offering a fiber rich diet.
        DogFood(category: "Good for Dogs", name: "Fiber", description: "Fiber is easily digested and will help with discomfort. Giving them a higher fiber diet will help them lose the weight and be healthy again. Another benefit is it controls the dog’s sugar levels. If you have a dog that has low sugar levels, you can control it by offering a fiber rich diet."),
        // Its composition, with high sugar levels, makes it a poor choice. If you do give your dog apple juice on occasion then serve it only sparingly. The home-made kind, pure juice, is obviously much healthier but may still cause bowel irregularity for canines. Always try to avoid giving your dog juices that contain lots of sugar.
        DogFood(category: "Bad for Dogs", name: "Apple juice", description: "Its composition, with high sugar levels, makes it a poor choice. If you do give your dog apple juice on occasion then serve it only sparingly. The home-made kind, pure juice, is obviously much healthier but may still cause bowel irregularity for canines. Always try to avoid giving your dog juices that contain lots of sugar."),
        // Commercial beef jerky, especially if manufactured in China, could be very unsafe and even fatal. Even most higher quality kinds are often loaded with chemical treatments that may be toxic for dogs. High levels of salt, preservatives and spices make feeding it questionable. Some brands, especially those made in China, have killed many pet dogs and seriously sickened thousands of others.
        DogFood(category: "Bad for Dogs", name: "Beef jerky", description: "Commercial beef jerky, especially if manufactured in China, could be very unsafe and even fatal. Even most higher quality kinds are often loaded with chemical treatments that may be toxic for dogs. High levels of salt, preservatives and spices make feeding it questionable. Some brands, especially those made in China, have killed many pet dogs and seriously sickened thousands of others."),
        // Commercially produced ginger ale contains high fructose corn syrup and other nasty chemicals that make it taste the way it does. No matter what your reasons for considering it, avoid serving this sweetened soft drink. This carbonated beverage isn’t going to help matters, regardless of the circumstances.
        DogFood(category: "Bad for Dogs", name: "Ginger ale", description: "Commercially produced ginger ale contains high fructose corn syrup and other nasty chemicals that make it taste the way it does. No matter what your reasons for considering it, avoid serving this sweetened soft drink. This carbonated beverage isn’t going to help matters, regardless of the circumstances."),
        // Eating rich and very fatty foods, like bacon, can sadly cause inflammation of your dog’s pancreas. When this gland becomes inflamed, it may cease to function efficiently and terrible health problems develop.
        DogFood(category: "Bad for Dogs", name: "Bacon", description: "Eating rich and very fatty foods, like bacon, can sadly cause inflammation of your dog’s pancreas. When this gland becomes inflamed, it may cease to function efficiently and terrible health problems develop."),
        // Butter can be very unhealthy especially if high cholesterol is an issue and can lead to blocked arteries and heart disease.
        DogFood(category: "Bad for Dogs", name: "Butter", description: "Butter can be very unhealthy especially if high cholesterol is an issue and can lead to blocked arteries and heart disease."),
        // Fruits are mostly water and sugar with some nutrients but they lack protein. In theory, fruits can be a good source of vitamins and other nutrients for dogs. In general, they do offer many beneficial aspects for a healthy life, but ultimately your dog is a meat eater.
        DogFood(category: "Good for Dogs", name: "Fruit", description: "Fruits are mostly water and sugar with some nutrients but they lack protein. In theory, fruits can be a good source of vitamins and other nutrients for dogs. In general, they do offer many beneficial aspects for a healthy life, but ultimately your dog is a meat eater."),
        // It could be healthy for them especially when it comes to digestion, allergies and for boosting low energy levels. Honey should be used in moderation since it contains a lot of sugar as well as high calories.
        DogFood(category: "Good for Dogs", name: "Honey", description: "It could be healthy for them especially when it comes to digestion, allergies and for boosting low energy levels. Honey should be used in moderation since it contains a lot of sugar as well as high calories. "),
        // It can help relieve nausea and motion sickness while improving poor blood flow, lack of appetite or a low pulse rate. In addition, it can remove toxins from your dog’s body. It may also work for reducing muscle spasms in the stomach or back.
        DogFood(category: "Bad for Dogs", name: "Ginger", description: "It can help relieve nausea and motion sickness while improving poor blood flow, lack of appetite or a low pulse rate. In addition, it can remove toxins from your dog’s body. It may also work for reducing muscle spasms in the stomach or back."),
        // Besides the lack of nutrition, it can lead to a poor lifestyle especially when fed routinely. Lactose and the high fat content are just a few factors.
        DogFood(category: "Bad for Dogs", name: "Ice cream", description: "Besides the lack of nutrition, it can lead to a poor lifestyle especially when fed routinely. Lactose and the high fat content are just a few factors."),
        // Your pet dog can have a pancake, but not too many or too often since they contain dairy and sugars.
        DogFood(category: "Bad for Dogs", name: "Pancakes", description: "Your pet dog can have a pancake, but not too many or too often since they contain dairy and sugars."),
        // Sugar is a big reason why your dog shouldn’t be routinely given Gatorade. While the levels in this drink are less than those found in most colas and many other beverages, it still contains several grams per serving.
        DogFood(category: "Good for Dogs", name: "Gatorade", description: "Sugar is a big reason why your dog shouldn’t be routinely given Gatorade. While the levels in this drink are less than those found in most colas and many other beverages, it still contains several grams per serving. "),
        // Dogs certainly need meat to thrive but Bologna has been processed which makes it less suitable for your pet. You have to consider the added salt and chemicals before you start relying on this mystery meat for rewarding your best buddy. The nitrates in particular are unhealthy and this applies to dogs and their owners.
        DogFood(category: "Bad for Dogs", name: "Bologna", description: "Dogs certainly need meat to thrive but Bologna has been processed which makes it less suitable for your pet. You have to consider the added salt and chemicals before you start relying on this mystery meat for rewarding your best buddy. The nitrates in particular are unhealthy and this applies to dogs and their owners."),
        //
        DogFood(category: "Good for Dogs", name: "Oranges", description: "Oranges are high in potassium, vitamin C, folate and thiamine. While considered to be healthy, Oranges aren’t a food that meets dog requirements. In fact, they can cause an upset stomach! This acidic fruit should only be given in moderation."),
        // There is nothing particularly dangerous about feeding your dog a bit of kiwi. They are highly nutritious and the health benefits are said to be numerous. For example, kiwi can protect against cellular oxidative damage. Regularly eating kiwi is also thought to help prevent respiratory diseases, specifically asthma, because of the high levels of Vitamin C.
        DogFood(category: "Good for Dogs", name: "Kiwi", description: "There is nothing particularly dangerous about feeding your dog a bit of kiwi. They are highly nutritious and the health benefits are said to be numerous. For example, kiwi can protect against cellular oxidative damage. Regularly eating kiwi is also thought to help prevent respiratory diseases, specifically asthma, because of the high levels of Vitamin C."),
        // Too much consumption and your dog may well experience the following: Diarrhea, Vomiting, Abdominal pain, Muscle cramps and sometimes seizures.
        DogFood(category: "Bad for Dogs", name: "Prunes", description: "Too much consumption and your dog may well experience the following: Diarrhea, Vomiting, Abdominal pain, Muscle cramps and sometimes seizures."),
        // In general, nuts are unhealthy for dogs as they contain an unknown toxin, which can affect the digestive and nervous systems and muscle.
        DogFood(category: "Bad for Dogs", name: "Almonds", description: "In general, nuts are unhealthy for dogs as they contain an unknown toxin, which can affect the digestive and nervous systems and muscle."),
        // Molasses is a natural sweetener that contains vitamin-B6, copper, iron, calcium, potassium, magnesium, manganese and selenium. Assuming it hasn’t been treated with chemicals, molasses is okay for dogs and may offer several potential health benefits.
        DogFood(category: "Good for Dogs", name: "Molasses", description: "Molasses is a natural sweetener that contains vitamin-B6, copper, iron, calcium, potassium, magnesium, manganese and selenium. Assuming it hasn’t been treated with chemicals, molasses is okay for dogs and may offer several potential health benefits."),
        // I do not recommend feeding your dog Nutella spread or any food containing chocolate or cocoa beans. Theobromine, a compound in Nutella, is also present in chocolate. This substance stimulates the cardiovascular system and central nervous system, which can cause an increase in blood pressure.
        DogFood(category: "Bad for Dogs", name: "Nutella", description: "I do not recommend feeding your dog Nutella spread or any food containing chocolate or cocoa beans. Theobromine, a compound in Nutella, is also present in chocolate. This substance stimulates the cardiovascular system and central nervous system, which can cause an increase in blood pressure."),
        /*//
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),
        //
        DogFood(category: "Bad for Dogs", name: "", description: ""),*/
        
        
        //PUT THIS AS THE LAST
        DogFood(category: "All", name: "DISCLAIMER", description: "This app is intended to be used by the public for viewing and retrieving information only. In providing information on this app, I have attempted to be as accurate as possible. However, I make no claims, guarantees or promises about the accuracy, currency, or completeness of the information provided and are not responsible for any errors or omissions, or for results obtained from the use of the information. Every possible effort is made to keep the content of this app accurate and current, but that may not always be the case. I will make an effort to correct errors brought to my attention. Distribution of the information does not constitute any warranty. The user assumes the risk of verifying any materials used or relied on. I, Jason McCoy, has made every effort to ensure that the information posted on this app are up-to-date and accurate. While I try to keep the information on this app updated timely and accurate, I make no expressed or implied guarantees. Further, since I cannot guarantee protection from potential alteration or tampering of the materials on this app or servers by outside parties, the information provided does not constitute official versions, and is not intended, nor can they be relied upon, to create any rights enforceable by any party in litigation with the State of California."),
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
    filteredFoodz = foodz.filter {
        (DogFood: DogFood) -> Bool in
      let categoryMatch = (scope == "All") || (DogFood.category == scope)
      return categoryMatch && DogFood.name.lowercased().contains(searchText.lowercased())
    }
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
