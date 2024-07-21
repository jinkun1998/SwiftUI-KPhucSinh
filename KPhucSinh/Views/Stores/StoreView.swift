//
//  StoreMapView.swift
//  KPhucSinh
//
//  Created by Jin on 7/7/24.
//

import SwiftUI
import MapKit

struct StoreView: View {
    
    @State private var position: MapCameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: StoreModel.stores.first!.latitude,
                longitude: StoreModel.stores.first!.longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: Consts.coordinateDelta,
                longitudeDelta: Consts.coordinateDelta
            )
        )
    )
    @State private var selectedStore: StoreModel?
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                Marker(
                    selectedStore?.name ?? StoreModel.stores.first!.name,
                    systemImage: "storefront",
                    coordinate: CLLocationCoordinate2D(
                        latitude: selectedStore?.latitude ?? StoreModel.stores.first!.latitude,
                        longitude: selectedStore?.longitude ?? StoreModel.stores.first!.longitude
                    )
                )
            }
            
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(StoreModel.stores) {store in
                            StoreCardView(store: store)
                                .onTapGesture {
                                    withAnimation {
                                        position = getPosition(store)
                                        selectedStore = store
                                    }
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
            }
            .padding(5)
        }
        .onAppear {
            selectedStore = StoreModel.stores.first
        }
    }
    
    func getPosition(_ store: StoreModel) -> MapCameraPosition {
        return MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: store.latitude,
                    longitude: store.longitude
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: Consts.coordinateDelta,
                    longitudeDelta: Consts.coordinateDelta
                )
            )
        )
    }
}

#Preview {
    StoreView()
}
