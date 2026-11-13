# WisdomConnect Food — Phase 4

Cross-platform Expo / React Native / TypeScript source for Android, iPhone and web. This is a development project, not a published app.

## Requirements and startup

Install Node.js 20.19+ and npm. From this directory:

```sh
npm install
npm run typecheck
npm run web
# Android/iOS testing:
npm start
```

Expo Go can open a development QR code on supported devices. Some production configurations require a development build rather than Expo Go. Run on a Mac with Xcode for an iOS simulator; Android Studio for Android emulator.

## Connect the backend

1. Create a Supabase project and enable email authentication.
2. Run `supabase.sql`, `supabase-phase3.sql`, and `supabase-phase4.sql` **in that order** in the Supabase SQL editor.
3. Copy `.env.example` to `.env`, enter the Supabase project URL and **public** anon/publishable key. Never use a service-role key in the app.
4. Sign up as a user. In the Supabase SQL editor, insert that user's UUID into `public.recipe_admins` using the sample command in `supabase-phase3.sql`. Never expose admin grant controls to ordinary users.
5. Sign in again; open Account > Recipe administration.

## Recipe administration

Admins can create, edit, publish, and delete custom recipes from within the app. Use one ingredient per line, e.g. `Rice | 2 | cups`; use one cooking instruction per line. Recipes remain drafts until the Published option is enabled. All uploaded/linked images and videos must be reviewed and properly licensed. The admin media fields accept HTTPS URLs; they do not upload files. Cooking video links open externally, not in an embedded player.

## Production builds

Install EAS CLI with `npm install -g eas-cli`, then:

```sh
eas login
eas build:configure
eas build --platform android --profile preview
eas build --platform android --profile production
eas build --platform ios --profile production
npx expo export --platform web
```

Configure EAS project ID, signing credentials, environment variables, domain and app-store accounts before production. iOS builds/distribution need an Apple Developer account; Play Store publishing needs a Google Play Console account. Use EAS Submit or the store portals after testing and compliance review.

## Testing checklist

- [ ] `npm install` and `npm run typecheck` succeed.
- [ ] Web navigation, recipe images, search, lesson steps, meal planner and shopping list work.
- [ ] Android and iPhone layouts, icons, splash and deep links are checked on real devices.
- [ ] Supabase signup, email verification, login, logout and session persistence work.
- [ ] Two accounts cannot read or overwrite one another's meal plans or shopping lists.
- [ ] Non-admin accounts cannot create/edit/delete recipes (test directly against the database).
- [ ] Admin can create a draft, edit it, publish it, unpublish it and delete it.
- [ ] Only published custom recipes are visible to non-admins.
- [ ] HTTPS media URLs work and images/video rights are documented.
- [ ] Recipe steps, ingredients, allergens and food safety instructions are reviewed by a qualified person.
- [ ] Test slow/offline network, loading, errors, accessibility and smaller screens.
- [ ] Publish privacy policy, terms, support contact and data-deletion process.
- [ ] Complete App Store privacy disclosures, Google Play Data Safety, age rating, screenshots and store descriptions.
- [ ] Run production builds, install and test them before submitting.

## Known limitations

Builds and device testing have not been completed in this environment. Sample remote recipe images may be inaccurate or unlicensed for commercial distribution; replace before release. Video support is external HTTPS linking, not in-app streaming. Shopping is a list, not payment checkout. Cloud sync is basic and does not resolve concurrent edits. Admin editing requires Supabase configuration and an authorized account. App icons are generated starter assets, not final brand-approved artwork.


## Phase 5
See `PHASE5-LAUNCH.md` for testing, build commands, known limitations and launch checklist.
