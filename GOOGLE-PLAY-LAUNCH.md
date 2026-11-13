# WisdomConnect Food: recipe-and-cooking launch

## First-release scope

African and Continental recipes, written cooking steps, recipe search, cuisine filters, weekly meal planning and an ingredient shopping list. The first store release disables online accounts and cloud synchronization. Plans and lists are saved on the device. My Kitchen lets people clear their saved kitchen data.

Video links appear only when a recipe has a reviewed video URL. No videos are bundled today. Food ordering, delivery, checkout, advertising and paid subscriptions are not implemented or advertised as current features.

## Google Play listing draft

**App name:** WisdomConnect Food

**Category:** Food & Drink

**Short description:** African and Continental recipes, guided cooking steps and weekly meal plans.

**Full description:**

Bring African and Continental flavours into your kitchen with WisdomConnect Food.

Explore familiar favourites and discover something new to cook. Browse recipes by cuisine, search by dish or country, and follow written cooking steps at your own pace.

MAKE EVERYDAY COOKING EASIER

- Explore African and Continental recipes.
- Check ingredients, preparation time and serving information.
- Move through guided cooking instructions one step at a time.
- Organize breakfast, lunch and dinner in a weekly meal planner.
- Add recipe ingredients to your shopping list and tick them off as you shop.
- Keep meal plans and shopping lists on your device without creating an account.

From Nigerian Jollof Rice and Chicken Suya to pasta, salmon and pizza, find ideas for your next meal and keep your cooking organized.

Internet access is needed to load recipe photos. Cooking instructions, meal plans and shopping lists are available locally. Check ingredient labels and adapt recipes to your dietary needs.

**Initial release notes:**

Explore African and Continental recipes, follow guided cooking steps, plan your weekly meals and build your ingredient shopping list. Your plans and lists are saved on your device. No account is required.

## Release configuration

- Android package: `ca.wisdomconnect.food`.
- Existing Expo project: `85036c8c-bad7-4d52-b3b6-2cb9473b2180`, owner `wisdomconnect.ca`.
- `production` creates an Android App Bundle for store distribution, uses remote signing credentials and disables cloud accounts with `EXPO_PUBLIC_ENABLE_CLOUD=false`.
- `phone-apk` creates a test APK with the Android template's test signing key. Do not submit that test-signed APK to Google Play.
- Keep the production upload key secure and configure Play App Signing.
- Build the production candidate after the remaining content, privacy and account prerequisites are resolved:

```sh
npx eas-cli build --platform android --profile production
```

## Remaining launch prerequisites

- [ ] Developer confirms a support/privacy email address and legal publisher details.
- [ ] Google Play Console account is registered and verified; organization verification may require a D-U-N-S number.
- [ ] Publish an accurate privacy policy at a public HTTPS webpage and link it inside the app and Play Console. Include local storage, remote photo requests, retention, deletion and support contact. Do not claim that no information leaves the device while external photos are loaded.
- [ ] Review each food photo for accuracy and commercial usage rights; replace generic or unsuitable photos before taking store screenshots.
- [ ] Review all ingredients and instructions for completeness, consistency, allergens and safe cooking.
- [ ] Capture real phone screenshots, provide the store icon and feature graphic, and complete the audience, content rating, ads, app access and Data Safety declarations against the final binary and all included SDKs.
- [ ] Verify target Android API 36 or higher for the current Google Play requirement.
- [ ] Configure production signing and create a production `.aab`.
- [ ] Install the store test build on real devices and verify startup, navigation, search, steps, planner/list persistence, clearing local data and offline behaviour.
- [ ] If the developer has a qualifying new personal account, complete the required closed test with at least 12 continuously opted-in testers for 14 days, then apply for production access.
- [ ] Submit for review. No Google Play listing or production publication has been created by preparing this source.

## Monetization after the first release

Start by validating the recipe-and-cooking experience. A later premium tier can add recipe collections, meal-planning tools and original cooking videos. Digital purchases will need billing, entitlements, restoration, subscription management and applicable store policy review before offering them. No subscription price, ad campaign or customer charge has been enabled.

## Official references checked 2026-11-13

- Store listing fields: https://support.google.com/googleplay/android-developer/answer/9859152
- Privacy and review requirements: https://support.google.com/googleplay/android-developer/answer/9859455
- Target API requirements: https://support.google.com/googleplay/android-developer/answer/11926878
- Personal-account testing: https://support.google.com/googleplay/android-developer/answer/14151465
- Account registration: https://support.google.com/googleplay/android-developer/answer/6112435
- Expo Android submission: https://docs.expo.dev/submit/android/
