'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "5bf36c7c0d37cabbcacc5eb567ab423f",
"assets/assets/icons/ad_blocker_switch_bg.svg": "9ea9ad0ff9c70263578bae755eef523f",
"assets/assets/icons/app.svg": "6b3e7aa801c9e199effc8c93aef6499a",
"assets/assets/icons/app_logo_empty.svg": "346fe872fc181b91231c511df34b0d17",
"assets/assets/icons/arrow_head_down.svg": "1a80a35af79e7535b32c7977d978b149",
"assets/assets/icons/block_control.svg": "368b187a6804c7b4e1c40ee08cf64700",
"assets/assets/icons/block_control_selected.svg": "bcc2a93259f5bd3cd1dc37aafaaf9054",
"assets/assets/icons/copy.svg": "68a1c7dcbcb9926ffd0c07ceb5488061",
"assets/assets/icons/faq.svg": "7d773d1686dd9bbb8df3cdb28e7bb159",
"assets/assets/icons/help.svg": "449536246ab1a3697caa7c486556bbdc",
"assets/assets/icons/history.svg": "8750fefd4721cc12882748ef8b06f9ec",
"assets/assets/icons/history_selected.svg": "8c212af94dfc450d60038be101db36e4",
"assets/assets/icons/home.svg": "494c7cd6177fae39ed28a4194152413a",
"assets/assets/icons/home_selected.svg": "9a94226a5ef783bbc7b30cd87a529c95",
"assets/assets/icons/ios_setting.png": "390af8a9b6959048c53ba2a67296ea48",
"assets/assets/icons/logo_kblock.svg": "441850444b57789042b9787ab3b3f822",
"assets/assets/icons/mail.svg": "1cc3b8c7be5510291f83fc6d88eb7954",
"assets/assets/icons/off.svg": "ec783382e73e59358297ffc3e91c6b3d",
"assets/assets/icons/off_down.svg": "99059570d024854f26967576ec84b1b2",
"assets/assets/icons/on.svg": "c4139d7d534b8f1f6a0055ff26a62576",
"assets/assets/icons/on_down.svg": "6b77b81789dee068c9281e5cefd452bc",
"assets/assets/icons/others.svg": "13316ae439f8c9faf45a66b699066c79",
"assets/assets/icons/others_selected.svg": "b994f898cede3af6324e57083c407cba",
"assets/assets/icons/power_gray.svg": "9dc0a661c8297b21a957866fd761cf38",
"assets/assets/icons/power_green.svg": "e5b5dd88a84482eaa770b79ae80b56e9",
"assets/assets/icons/power_orange.svg": "671e8aabeb0fa820f4eb02ad638b1805",
"assets/assets/icons/question_mark.svg": "4c68bb99bf57172ade0a34dfb1af76bc",
"assets/assets/icons/safari.png": "ddae12be42e378f045d06754da3ff354",
"assets/assets/icons/switch_on.svg": "88985a12e8d785581c438990c65a8b61",
"assets/assets/icons/toggle_off.svg": "5247cfefb85e5497d07556699214bf74",
"assets/assets/icons/toggle_on.svg": "0d539dba16479329e6828195c7792baa",
"assets/assets/icons/tutorial_illustration.svg": "c82bf8a5c08ee70afbc508eef3632a65",
"assets/assets/icons/youtube.svg": "250bbc75df7bc76312fe5088538495bf",
"assets/assets/images/app_sample_1.png": "fc8561b501f1a158829e498452793626",
"assets/assets/images/app_sample_10.png": "421a2c6285729f4f5817d136f5793ce7",
"assets/assets/images/app_sample_11.png": "f468bb5a285312a8d0def54bf940a1b5",
"assets/assets/images/app_sample_2.png": "5bf3baf98926023ce5b9205e0eccf963",
"assets/assets/images/app_sample_3.png": "5babe6c65f35b476281c3f406c699dce",
"assets/assets/images/app_sample_4.png": "30463ea9477e042c0c225b0880978374",
"assets/assets/images/app_sample_5.png": "0339639b3e21bd8e27e3ba0ebdcf4139",
"assets/assets/images/app_sample_6.png": "e20d26dcb9f504d1bfd2eacc06b14570",
"assets/assets/images/app_sample_7.png": "77b86aefad654d8de7537a0b5ed1e7f3",
"assets/assets/images/app_sample_8.png": "738187698d534aea6d2a7f966fa7ffcb",
"assets/assets/images/app_sample_9.png": "cd8f1d6bad7a2df6a80be00efdf596b4",
"assets/FontManifest.json": "57533cba45d8032f42f1125105afa162",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/NunitoSans-BlackItalic.ttf": "c5ef9713df6633c8dd9e42c1a45495de",
"assets/fonts/NunitoSans-Bold.ttf": "ac72fe0f27dd514aa3215e8424842062",
"assets/fonts/NunitoSans-SemiBold.ttf": "2836528ad13278d88bcc509dc3f8102b",
"assets/NOTICES": "d1e7dafae798e3bb4400b19121a52fe5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/widgetbook/google_fonts/Nunito-Black.ttf": "85808a77c229143ee72bbb7784907da8",
"assets/packages/widgetbook/google_fonts/Nunito-BlackItalic.ttf": "788f29842adade8caaf17be2a317e1da",
"assets/packages/widgetbook/google_fonts/Nunito-Bold.ttf": "1387652ed98293a3e2b6639d21d2dd40",
"assets/packages/widgetbook/google_fonts/Nunito-BoldItalic.ttf": "13420730c456db9463829a7a9a8d0c3a",
"assets/packages/widgetbook/google_fonts/Nunito-ExtraBold.ttf": "bb41f596e9c909d1279f79b06c11c3eb",
"assets/packages/widgetbook/google_fonts/Nunito-ExtraBoldItalic.ttf": "3d69caac1feaa544d89721dffa4dae9b",
"assets/packages/widgetbook/google_fonts/Nunito-ExtraLight.ttf": "9894a78faa3fc60eaa8177413c67fc9d",
"assets/packages/widgetbook/google_fonts/Nunito-ExtraLightItalic.ttf": "18b10873671ef699a9c6b6a562c47c72",
"assets/packages/widgetbook/google_fonts/Nunito-Italic.ttf": "b8e5eda1dd4207b4f7488718bf1b13f9",
"assets/packages/widgetbook/google_fonts/Nunito-Light.ttf": "038291099699a91e5486d90f6865865b",
"assets/packages/widgetbook/google_fonts/Nunito-LightItalic.ttf": "2668f7df2cd1d2c95ca64435d9783284",
"assets/packages/widgetbook/google_fonts/Nunito-Regular.ttf": "1c030dd4e715ec504fe4925864f023fe",
"assets/packages/widgetbook/google_fonts/Nunito-SemiBold.ttf": "06578957e8dca70fbe9573fbce76c0a0",
"assets/packages/widgetbook/google_fonts/Nunito-SemiBoldItalic.ttf": "8e1046cce01ec078ff8a0a03e5e061ed",
"assets/packages/widgetbook/google_fonts/OFL.txt": "ee247edc304c64bb2135b9b6ec9a203f",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ed84e1773862013f571c9657a62b35fc",
"/": "ed84e1773862013f571c9657a62b35fc",
"main.dart.js": "bd55a9c239904fe5197506bb75667c91",
"manifest.json": "8042d3ff19d2ce47bf4f81d566c14aec",
"version.json": "cd5f8e4f397b86cb39c7ace6ea433c04"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
