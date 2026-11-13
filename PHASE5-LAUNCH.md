# WisdomConnect Food — Phase 5 release guide

## Current verification
- ZIP structure and JSON configuration verified in the authoring environment.
- `npm install` attempted but timed out due to dependency retrieval; **no successful TypeScript, Expo export, native build, or physical-device test is claimed**.
- Fixed recipe search memoization to refresh after cloud recipe changes.
- Removed unused legacy recipe-creation code, added web deletion confirmation, and reset account data on auth logout.

## Install and test locally
1. Install Node.js LTS and unzip this project.
2. Run `npm install`.
3. Run `npm run typecheck` and `npx expo-doctor`. Fix any issues reported by your environment.
4. Run `npm run web`, and then `npm run export:web` to produce the static `dist/` site.
5. Run `npm start` for Expo Go mobile testing; test both Android and iPhone.

## Cloud configuration
- Create a Supabase project; copy `.env.example` to `.env` and enter public project URL and publishable/anon key. **Never put the service-role key in the app.**
- Apply SQL scripts in order: `supabase.sql`, `supabase-phase3.sql`, `supabase-phase4.sql`.
- Grant the administrator role manually via trusted Supabase SQL editor after creating your account.
- Test that ordinary users cannot modify recipes or view unpublished drafts.
- Verify email confirmation, password reset (not yet implemented), sign-out, cross-device synchronization, and user data privacy.

## Native release builds
- Create an Expo account, install `eas-cli`, and run `eas login` then `eas build:configure`.
- Verify package IDs and legal ownership: `ca.wisdomconnect.food`.
- Android internal APK: `eas build --platform android --profile preview`.
- Production Android: `eas build --platform android --profile production`.
- iOS production: `eas build --platform ios --profile production` (Apple Developer membership required).
- Store submission: `eas submit --platform android --profile production` and `eas submit --platform ios --profile production` after account/store setup.

## Required release QA
- [ ] App starts without errors on Android, iPhone, Chrome, Safari.
- [ ] Recipe search and category filters update after admin publishes a recipe.
- [ ] Every recipe has reviewed ingredients, food-safety instructions, and image rights.
- [ ] Cooking video URLs are approved, safe and functional.
- [ ] Admin create/edit/publish/delete works; non-admin access denied by RLS.
- [ ] Weekly planner and shopping list persist after restart and sync after login.
- [ ] Test sign-in/sign-up, account switching, sign-out, offline behavior, and failed network requests.
- [ ] Add account deletion and privacy policy before production release.
- [ ] Add password recovery and legal terms.
- [ ] Add accessibility labels, responsive layout QA, and performance checks.
- [ ] Prepare store screenshots, support contact, privacy declarations, age rating and listing copy.
- [ ] Review trademark/brand permissions, app icons, external media licenses.

**This is a release candidate source bundle, not an approved or published app.**
