import { Socket } from "net"
import * as path from "path"
import { commands, ExtensionContext, window, workspace } from "vscode"
import {
  LanguageClient,
  LanguageClientOptions,
  RevealOutputChannelOn,
  ServerOptions,
  TransportKind,
} from "vscode-languageclient/node"

let client: LanguageClient

export function activate(context: ExtensionContext) {
  let disposable = commands.registerCommand("proto-x.helloWorld", () => {
    window.showInformationMessage("Hello World from Proto X!!")
  })

  context.subscriptions.push(disposable)

  const debugOptions = { execArgv: [] }

  const serverOptions: ServerOptions = async () => {
    let socket = new Socket()
    socket = socket.connect({
      host: "127.0.0.1",
      port: 8077,
    })

    socket.on("connect", console.log)

    return {
      writer: socket,
      reader: socket,
    }
  }

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "proto-x" }],
    diagnosticCollectionName: "sample",
    revealOutputChannelOn: RevealOutputChannelOn.Never,
    progressOnInitialization: true,
    synchronize: {
      fileEvents: workspace.createFileSystemWatcher("**/.clientrc"),
    },
  }

  client = new LanguageClient(
    "protox-lsp",
    "Proto X Language Server",
    serverOptions,
    clientOptions
  )

  client.registerProposedFeatures()

  context.subscriptions.push(client.start())
}

export function deactivate(): Thenable<void> | undefined {
  if (!client) {
    return undefined
  }
  return client.stop()
}
