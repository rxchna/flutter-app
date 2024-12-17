import 'package:flutter/material.dart';
import 'package:minions_project_2/main.dart';
import 'package:minions_project_2/single_product_screen.dart';
import 'Watch.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Build watches list
    List<Watch> watches = [
      Watch(
        watchID: 1,
        watchName: 'Nova Orion Rose',
        watchDesc: 'Glamorous rose gold meets bold titanium, a cosmic pairing. The 38mm Orion Rose channels an awe for the celestial with a future-forward design sensibility and dual timezone functionality.',
        watchImages: [
          'images/watches/watch_orion_rose_1.png',
          'images/watches/watch_orion_rose_2.png',
          'images/watches/watch_orion_rose_3.png',
        ],
        watchPrice: 385.00
      ),
      Watch(
          watchID: 2,
          watchName: 'Airhawk Stealth Black',
          watchDesc: 'The 42mm Airhawk\'s clean dial reads easy and features multi-function sub dials for your timekeeping experience. The Stealth Black balances a black steel colorway with a pop of red on the second hand.',
          watchImages: [
            'images/watches/watch_matte_black_1.png',
            'images/watches/watch_matte_black_2.png',
            'images/watches/watch_matte_black_3.png',
          ],
          watchPrice: 415.00
      ),
      Watch(
          watchID: 3,
          watchName: 'Purple Dot Vibe',
          watchDesc: 'Soft and sweet that packs a punch. This fits-just-right 36mm design features domed dial markers, a curved silhouette and a softly sculpted crown with first wine purple and rose gold colorway.',
          watchImages: [
            'images/watches/purple_dot_vibe_1.png',
            'images/watches/purple_dot_vibe_2.png',
            'images/watches/purple_dot_vibe_3.png',
          ],
          watchPrice: 400.50
      ),
      Watch(
          watchID: 4,
          watchName: 'International Waters',
          watchDesc: 'As serene and mysterious as the open ocean. The International Waters features aquatic blues and silver steel tones. With a 36mm case made of hardened mineral crystal.',
          watchImages: [
            'images/watches/watch_silver_blue_1.png',
            'images/watches/watch_silver_blue_2.png',
            'images/watches/watch_silver_blue_3.png',
          ],
          watchPrice: 371.50
      ),
      Watch(
          watchID: 5,
          watchName: 'Raptor Electric Blue',
          watchDesc: 'Our sleek and resistant self-winding Raptor features a Japanese Miyota 8250 automatic movement (open heart + exhibition case back), Waterproof guarantee (10 ATM + screw-down crown), Japanese super lume, and scratch resistant K1 crystal + shock resistance.',
          watchImages: [
            'images/watches/watch_ceramic_blue_1.png',
            'images/watches/watch_ceramic_blue_2.png',
            'images/watches/watch_ceramic_blue_3.png',
          ],
          watchPrice: 560.00
      ),
      Watch(
          watchID: 6,
          watchName: 'Galaxy Midnight',
          watchDesc: 'Run on spacetime in the Galaxy Midnight color story. Explore the starry golds of space and the vibrations of blue goldstone on the best selling Signature Square, a West Coast revamp of an iconic 90\'s square shape.',
          watchImages: [
            'images/watches/watch_galaxy_midnight_1.png',
            'images/watches/watch_galaxy_midnight_2.png',
            'images/watches/watch_galaxy_midnight_3.png',
          ],
          watchPrice: 345.00
      ),
      Watch(
          watchID: 7,
          watchName: 'Avenue Chelsea Gold',
          watchDesc: 'Inspired by the classic style of New York, the Avenue has a petite 28mm case and minimalist dial. The Chelsea Gold wears an all-over gold colorway. Its case material features yellow Gold ionic-plated stainless steel.',
          watchImages: [
            'images/watches/watch_gold_1.png',
            'images/watches/watch_gold_2.png',
            'images/watches/watch_gold_3.png',
          ],
          watchPrice: 385.00
      ),
      Watch(
          watchID: 8,
          watchName: 'Raptor Shock Blue',
          watchDesc: 'The Raptor Sport Series in Shock Blue balances a future-forward chronograph design with a 10 ATM water resistant case and custom molded silicone band.',
          watchImages: [
            'images/watches/raptor_shock_1.png',
            'images/watches/raptor_shock_2.png',
            'images/watches/raptor_shock_3.png',
          ],
          watchPrice: 560.50
      ),
      Watch(
          watchID: 9,
          watchName: 'Ceramic Matte Green',
          watchDesc: 'The California-clean Element Collection meets advanced ceramic technology. Featuring a Matte Green pigment, a finish so rich it could only be achieved by meticulously diamond-blasting our rare and resistant ceramic material.',
          watchImages: [
            'images/watches/watch_matte_green_1.png',
            'images/watches/watch_matte_green_2.png',
            'images/watches/watch_matte_green_3.png',
          ],
          watchPrice: 425.50
      ),
      Watch(
          watchID: 10,
          watchName: 'Voyager Bronze Age',
          watchDesc: 'The Voyager Bronze Age\'s 42mm case is built for adventure, with 10 ATM water resistant technology and dual timezone functionality for any hour, any latitude. Featuring MVMT\'s Nordic design with pebbled sage grey leather and a muted bronze case.',
          watchImages: [
            'images/watches/watch_bronze_1.png',
            'images/watches/watch_bronze_2.png',
            'images/watches/watch_bronze_3.png',
          ],
          watchPrice: 252.00
      ),
      Watch(
          watchID: 11,
          watchName: 'Ruby Red',
          watchDesc: 'Inspired by the iconic streets of Los Angeles, the Ruby Red is a minimalist staple made to move from effortlessly relaxed casual looks to night fits. Featuring our Garden Party seasonal color story, with a red pop leather band and fresh metals.',
          watchImages: [
            'images/watches/ruby_red_1.png',
            'images/watches/ruby_red_2.png',
            'images/watches/ruby_red_3.png',
          ],
          watchPrice: 180.00
      ),
      Watch(
          watchID: 12,
          watchName: 'Odyssey Green',
          watchDesc: 'A West Coast approach to an iconic 1970\'s silhouette. Reimagined from the distinct 70\’s shape that\’s defied the ordinary for decades, the Odyssey II features hand-polished steel contrasts, faceted hour markers that glint in motion, and a sleek profile.',
          watchImages: [
            'images/watches/odyssey_1.png',
            'images/watches/odyssey_2.png',
            'images/watches/odyssey_3.png',
          ],
          watchPrice: 220.00
      )
    ];

    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 4 : 2; // Number of cards per row

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomeScreen(),
                  ),
                );
              },
              child: Image.asset(
                'images/minion_logo_yellow.png',
                height: 32,
                width: 32,
              ),
            ),
            const SizedBox(height: 10), // Space between the image and title
            const Text(
              "Shop Watches",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        toolbarHeight: 85,
      ),
      body: ListView.builder(
        itemCount: (watches.length / crossAxisCount).ceil(), // Total number of rows
        itemBuilder: (context, rowIndex) {
          // Calculate range of watches to be displayed in row
          int start = rowIndex * crossAxisCount;
          int end = start + crossAxisCount;

          // Ensure end doesn't exceed the length of the watches list
          if (end > watches.length) {
            end = watches.length;
          }

          // Extract watches for this row
          List<Watch> rowWatches = watches.sublist(start, end);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowWatches.map((current_watch) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(currentWatch: current_watch),
                      ),
                    ),
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shadowColor: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image of the watch
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Hero(
                              tag: 'watch_${current_watch.watchID}',  // Hero animation
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  current_watch.watchImages[0],
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                          // Watch name and price
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  current_watch.watchName,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '\$${current_watch.watchPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                    color: Color(0xFFE7B601),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
