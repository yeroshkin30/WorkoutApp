//
//  SettingsView.swift
//  iOSDevTestApp
//
//  Created by oleh yeroshkin on 18.06.2024.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Settings".uppercased())
                    .font(.system(size: 32))
                    .foregroundStyle(Color.white)
                    .padding()
                
                VStack(spacing: 0){
                    NavigationLink {
                        PolicyTermsView(text: privacyPolicyText)
                            .navigationTitle("Policy")
                    } label: {
                        SettingsRow(image: Image(.privacyPolicy), text: "Privacy Policy")
                    }

                    Rectangle()
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal, 16)

                    NavigationLink {
                        PolicyTermsView(text: privacyPolicyText)
                            .navigationTitle("Terms")
                    } label: {
                        SettingsRow(image: Image(.termOfUse), text: "Terms of Use")
                    }
                }
                .background(.rowBackground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .background(.backgroundMain)
        }
    }
}

struct PolicyTermsView: View {
    @Environment(\.dismiss) var dismiss
    let text: String

    var body: some View {
        ScrollView {
            Text(text)
                .padding()
                .foregroundStyle(.white)
        }
        .background(
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        .background(.backgroundMain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}


struct SettingsRow: View {
    let image: Image
    let text: String

    var body: some View {
        HStack {
            image
            Text(text)
                .font(.system(size: 17))
                .foregroundStyle(Color.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.white)
        }
        .padding()
    }
}



let privacyPolicyText = "POLICY In addition to the terms set out in the standard “LICENSED APPLICATION END USER LICENSE AGREEMENT” (can be found here http://www.apple.com/legal/internet-services/itunes/appstore/dev/stdeula/), users agree to the Application collecting certain detailed user information indicated in EULA & PRIVACY POLICY below. 1. INTRODUCTION This Privacy Policy applies when you use any of the Apps of this publisher and should be read together with the End User License Agreement EULA. By using a Publisher’s App, you are consenting to our processing of your information in ways set out in this Privacy Policy. If you do not agree with it, please do not use any Publisher’s Apps. In certain cases, for example, if geolocation data is processed by the relevant Publisher’s App, the Publisher’s App will prompt you to give additional consent. In such case, you can choose not to give consent to us processing data related to your location but you can still use the Publisher’s App.This Privacy Policy may change so you should review it regularly. We will notify you of any material changes in the way we treat your information through the Publisher’s Apps you use. 2. DATA WE COLLECT When you use an Publisher’s App, Publisher may collect data, including information which directly or indirectly identifies you. Your information may be kept in an identifiable format, or in an aggregate format which means that you cannot reasonably be identified from it. The information we collect about you includes: If an Publisher’s App offers you the option to register, we will collect the information you provide to us in the registration form. This may include identification data such as your name, email address or other account or registration information.We will also collect your information when you use Publisher’s Apps such as when you post or share material, upload data, request further services or make selections using the Publisher’s Apps, if such functionality is available in the Publisher’s App.We will collect information about you when you interact with us such as when you report a problem, contact or communicate with us.We may collect certain device information and electronic identifiers such as your mobile device identifier provided by your mobile device operating system, your mobile operating system details and the name of your mobile carrier. For example, if you use the iOS platform then Advertiser IDs (also known as “IDFAs”) may be collected. Other identifiers collected may include IP addresses, OpenUDID, Session ID, ODIn1, iOS Vendor IDs, MAC addresses, IMEI, Android ID for Android platform, and ODIN1 for OS X (together with the IDFAs, the “App Identifiers”).Information about how and when you use the Publisher’s App. This includes the amount of times you used the Publisher’s App, which parts of it you viewed and other technical data such as country settings and timestamps.Geolocation data, which is any information which indicates the geographical position of your device and which may include the time the location was recorded. Before processing any precise GPS geolocation data, the Publisher’s App will require you to give your consent, which you can revoke by changing the privacy settings of your device.Any of your information you provide or permit to be provided to us via a social network or public forum provider like Facebook when you link the Publisher’s App to your social network or public forum account. This data may include your use of the Publisher’s App on such public forums and/or social networks, including with whom you share the Publisher’s App. For further information how and for what purpose the social network provider collects etc. your data see their privacy policy.We automatically collect certain information from your device when you use the Publisher’s App including information about your device, carrier and other technical data."
