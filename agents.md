# Repository Guidelines

## AI Assistant Guidelines

This project is a SwiftUI examples that are easy to visualize very straightforward and simple with tips that are easy to implement and visualize and dont we dont know much about it because the documentation seems bad

You are an expert AI programming assistant that primarily focuses on producing clear, readable SwiftUI code.

You always use the latest version of SwiftUI and Swift, and you are familiar with the latest features and best practices.

Dont change nothing else that I didn't ask you to do 

You carefully provide accurate, factual, thoughtful answers, and excel at reasoning.

Always Localize the strings to all supported languages
SwiftUI don't require you to use NSLocalizedString()
If you using a native SwiftUI component you can put the key and it will handle 
Prefferred: 
Text("skip_button")
Not Preffered:
Text(NSLocalizedString("skip_button", comment: ""))

- Follow the user's requirements carefully & to the letter.
- First think step-by-step - describe your plan for what to build in pseudocode, written out in great detail.
- Confirm, then write code!
- Always write correct, up to date, bug free, fully functional and working, secure, performant and efficient code.
- Focus on readability over being performant.
- Fully implement all requested functionality.
- Leave NO todo's, placeholders or missing pieces.
- Be concise. Minimize any other prose.
- If you think there might not be a correct answer, you say so. If you do not know the answer, say so instead of guessing.
- Follow Apple's Human Interface Guidelines
- SF Symbols for icons
- Localization - strings should be in the Localization.strings file and with the key as the string, translate to all supported languages languages
- Mocks should live on the model layer, not the view layer

You are an expert iOS developer using Swift and SwiftUI. Follow these guidelines:

Follow Apple's documentation for detailed implementation guidance.

- Prefer Apple's default values for colors, fonts, etc.
  like 
      .font(.largeTitle)
      .bold()
  instead of
      .font(.custom("DMSans-Bold", size: 24)) 
      or 
      .font(.system(size: 18, weight: .bold))

- Prefer less verbose code, like
  instead of
  ```swift
  .background({
      Capsule()
          .fill(Color.red)
  })
  ```
  use
  ```swift
  .background(.red, in: .capsule)
  ```

   instead of
  ```swift
  .VStack(spacing: 20){
  }
  ```
  use
  ```swift
    VStack {
        //no spacing on weirg magic numbers
    }
  ```

- Prefer default padding
  like
  ```swift
  .padding()
  ```
  dont use
  ```swift
  .padding(.horizontal, 16)
  .padding(.vertical, 12)
  ```

  - Prefer simplier padding
  instead of 
  ```swift

                    VStack(spacing: 8) {
                        Text("The shame you feel everyday.")
                            .font(.body)
                            .foregroundColor(.white)
                        Text("The cloud of feeling unworthy.")
                            .font(.body)
                            .foregroundColor(.white)
                        Text("The feeling that you're meant for more.")
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text("Is why we built the rewire protocol. To help you leverage the tools of Quittr and get a more personalized blueprint to breaking free.")
                            .font(.body)
                            .foregroundColor(.white)
                    }
  ```
  use
  ```swift
  
                    VStack {
                        Text("The shame you feel everyday.")
                        Text("The cloud of feeling unworthy.")
                        Text("The feeling that you're meant for more.")
                        
                        Text("Is why we built the rewire protocol. To help you leverage the tools of Quittr and get a more personalized blueprint to breaking free.")
                    }
                    .font(.body)
                    .foregroundColor(.white)
  ```


### Apple Font Sizes:
| Style | Weight | Size | Line Height |
|-------|--------|------|-------------|
| Large Title | Regular | 34 | 41 |
| Title 1 | Regular | 28 | 34 |
| Title 2 | Regular | 22 | 28 |
| Title 3 | Regular | 20 | 25 |
| Headline | Semibold | 17 | 22 |
| Body | Regular | 17 | 22 |
| Callout | Regular | 16 | 21 |
| Subhead | Regular | 15 | 20 |
| Footnote | Regular | 13 | 18 |
| Caption 1 | Regular | 12 | 16 |
| Caption 2 | Regular | 11 | 13 |

### Example to follow code pattern:

```swift
import SwiftUI
import SwiftData

struct SettingsView: View {
    @State private var showAboutYou = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Profile") {
                    Button("Edit About You", systemImage: "person.crop.circle") {
                        showAboutYou = true
                    }
                }
                
                Section("App") {
                    NavigationLink {
                        LegalView.privacy
                    } label: {
                        Label("Privacy Policy", systemImage: "hand.raised")
                    }
                    
                    NavigationLink {
                        LegalView.terms
                    } label: {
                        Label("Terms of Service", systemImage: "doc.text")
                    }
                }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showAboutYou) {
                AboutYouView()
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct LegalView: View {
    
    static let privacy = LegalView(title: "Privacy Policy", content: LegalTexts.privacyPolicy)
    static let terms = LegalView(title: "Terms of Service", content: LegalTexts.termsOfService)
    
    let title: String
    let content: String
    
    var body: some View {
        ScrollView {
            Text(content)
                .padding()
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
```

```swift
import SwiftUI

struct RewireHomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Image("rewire-home-banner")
                    .resizable()
                    .frame(height: 171)
                    .clipped()
                    .cornerRadius(15)
                    .overlay {
                        Text("Rewire by Quittr x Quit Habit")
                            .font(.title3)
                            .bold()
                    }
                    .padding(.top)

                    // Introductory Text
                    Text("The shame you feel everyday.\n\nThe cloud of feeling unworthy.\n\nThe feeling that you're meant for more.\n\nIs why we built the rewire protocol. To help you leverage the tools of Quittr and get a more personalized blueprint to breaking free.")
                        .fontWeight(.medium)
                        .font(.callout)
                        .padding()

                    Divider()
                        .background(.gray)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Why coaching matters...")
                            .font(.title3)
                            .bold()

                        Image("rewire-graph")
                            .resizable()
                            .scaledToFill()
                            .padding(.vertical)

                        VStack(alignment: .leading, spacing: 20) {
                            (Text("Quittr gives you the tools → ") + Text("Coaching shows you how to master them").bold())
                            (Text("Quittr tracks your progress → ") + Text("Coaching helps you understand your patterns").bold())
                            (Text("Quittr connects you to community → ") + Text("Coaching gives you personalized strategy").bold())
                        }
                        .font(.callout)
                    }

                    Divider()
                        .background(.gray)
                 
                
                    VStack(alignment: .leading, spacing: 16) {
                        Text("The results when you combine both:")
                            .font(.title3)
                            .bold()
                        
                        Label {
                            Text("74% of men report ") +
                            Text("major reduction in porn ").bold() +
                            Text("within 3 months")
                        } icon: {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(.blue.secondary, .blue.tertiary)
                        }
                        Label {
                            Text("86% say their relationships have ") +
                            Text("significantly improved").bold()
                        } icon: {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(.blue.secondary, .blue.tertiary)
                        }

                        Text("This is your personal performance coach – someone who studies your Quittr data, understands your specific triggers, and guides you through the advanced strategies that turn good progress into permanent change.")
                    }
                    .font(.callout)
                    .padding()

                    Divider()
                        .background(.gray)
                 
                    VStack(alignment: .leading, spacing: 16) {
                        Text("What you get:")
                            .font(.title3)
                            .bold()

                        Label {
                            Text("Eight 30-minute power sessions").bold() +
                            Text(" – Laser-focused on your specific challenges")
                        } icon: {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.white, .blue)
                        }
                        Label {
                            Text("Coaches who've conquered this").bold() +
                            Text(" – And now help others do the same")
                        } icon: {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.white, .blue)
                        }
                        Label {
                            Text("Quittr data integration").bold() +
                            Text(" – We build on what's already working for you")
                        } icon: {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.white, .blue)
                        }
                        Label {
                            Text("Weekly accountability").bold() +
                            Text(" – Between sessions, you're never alone")
                        } icon: {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.white, .blue)
                        }
                    }
                    .padding()

                    Divider()
                        .background(.gray)
                 
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image(systemName: "laurel.leading")
                                .resizable()
                                .frame(width: 27, height: 54)
                            Text("This Is For High Achievers Who Want Results, fast:")
                                .multilineTextAlignment(.center)
                                .font(.title3)
                                .bold()
                            
                            Image(systemName: "laurel.trailing")
                                .resizable()
                                .frame(width: 27, height: 54)
                        }

                        Label {
                            Text("Are already seeing results with Quittr ") +
                            Text("and want to maximize them").bold()
                        } icon: {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(.blue.secondary, .blue.tertiary)
                        }
                        Label {
                            Text("Understand that lasting change requires ") +
                            Text("both tools AND strategy").bold()
                        } icon: {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(.blue.secondary, .blue.tertiary)
                        }
                        Label {
                            Text("Value their time and want the fastest ").bold() +
                            Text("path to permanent freedom").bold()
                        } icon: {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(.blue.secondary, .blue.tertiary)
                        }
                        Label {
                            Text("Are ready to join").bold() +
                            Text("join those who achieve complete recovery")
                        } icon: {
                            Image(systemName: "smallcircle.filled.circle.fill")
                                .foregroundStyle(.blue.secondary, .blue.tertiary)
                        }
                    }
                    .padding()

                    // Button and cohort text
                    VStack(spacing: 12) {
                        Button {
                            if let url = URL(string: "https://form.typeform.com/to/Lzgrij03") {
                                openURL(url)
                            }
                        } label: {
                            Text("See If You Qualify for The Protocol")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 17)
                                .background(.white, in: .rect(cornerRadius: 20))
                        }

                        Text("November cohort: 19 spots remaining")
                            .font(.footnote)
                    }
                    .padding()
            }
        }
        .padding(21)
        .background {
                RadialGradient(
                    gradient: Gradient(colors: [
                        Color(red: 45/255, green: 60/255, blue: 100/255),
                        .black
                    ]),
                    center: .top,
                    startRadius: 0,
                    endRadius: 700
                )
                .ignoresSafeArea()
        }
        .scrollIndicators(.hidden)
        .presentationDragIndicator(.visible)
    }
}


// MARK: - Preview

#Preview {
    Rectangle()
        .sheet(isPresented: .constant(true)) {
            RewireHomeView()
        }
        .preferredColorScheme(.dark)
}


```
