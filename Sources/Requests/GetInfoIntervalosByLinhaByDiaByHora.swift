//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API {

    /** Permite obter o intervalo entre comboios previsto por horário (frequência) para uma determinada hora. */
    public enum GetInfoIntervalosByLinhaByDiaByHora {

        public static let service = APIService<Response>(id: "getInfoIntervalosByLinhaByDiaByHora", tag: "", method: "GET", path: "/infoIntervalos/{linha}/{dia}/{hora}", hasBody: false, securityRequirements: [])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Identificação da linha que pretendem consultar. Possíveis valores: Amarela, Azul, Verde, Vermelha */
                public var linha: String

                /** S para dia de semana, F para feriados ou fim de semana. */
                public var dia: String

                /** Hora no formato hhmmss */
                public var hora: String

                public init(linha: String, dia: String, hora: String) {
                    self.linha = linha
                    self.dia = dia
                    self.hora = hora
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetInfoIntervalosByLinhaByDiaByHora.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(linha: String, dia: String, hora: String) {
                let options = Options(linha: linha, dia: dia, hora: hora)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "linha" + "}", with: "\(self.options.linha)").replacingOccurrences(of: "{" + "dia" + "}", with: "\(self.options.dia)").replacingOccurrences(of: "{" + "hora" + "}", with: "\(self.options.hora)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Void
            case status200

            public var success: Void? {
                switch self {
                case .status200: return ()
                }
            }

            public var response: Any {
                switch self {
                default: return ()
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = .status200
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}