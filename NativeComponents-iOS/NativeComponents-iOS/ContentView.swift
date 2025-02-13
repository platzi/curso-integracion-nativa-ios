//
//  ContentView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ContentView: View {
    private var headerView: some View {
        VStack(alignment: .center) {
            Text("Integración de Componentes")
                .font(.title2.weight(.bold))
                .frame(minWidth: 0, maxWidth: .infinity)
            Text("Nativos en iOS")
                .font(.title3.weight(.medium))
                .foregroundStyle(.secondary)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        headerView
                    }
                    Section {
                        NavigationLink("MÓDULO 1\n\nCaracterísticas nuevas de iOS 18") {
                            ModuloUnoView()
                        }
                        NavigationLink("MÓDULO 2\n\nInteracción con el Usuario y Sistema Operativo") {
                            ModuloDosView()
                        }
                        NavigationLink("MÓDULO 3\n\nMultimedia y Medios Visuales") {
                            ModuloTresView()
                        }
                        NavigationLink("MÓDULO 4\n\nGráficos y Sensores") {
                            ModuloCuatroView()
                        }
                        NavigationLink("MÓDULO 5\n\nSalud y Bienestar") {
                            ModuloCincoView()
                        }
                        NavigationLink("MÓDULO 6\n\nGeolocalización y Mapas") {
                            ModuloSeisView()
                        }
                        NavigationLink("MÓDULO 7\n\nNotificaciones y Comunicación") {
                            ModuloSieteView()
                        }
                        NavigationLink("MÓDULO 8\n\nManejo de Datos y Almacenamiento") {
                            ModuloOchoView()
                        }
                    }
                    .padding(.all, 15)
                }
            }
        }
    }

}

#Preview {
    ContentView()
}
