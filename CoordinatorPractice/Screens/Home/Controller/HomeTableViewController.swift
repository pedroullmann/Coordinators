//
//  HomeTableViewController.swift
//  CoordinatorPractice
//
//  Created by Pedro Ullmann on 12/22/19.
//  Copyright © 2019 Pedro Ullmann. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // MARK: - Properties
    private let viewModel: HomeViewModel
    private let pokemonCellIdentifier = "pokemonCell"
    private let paging = Paging(limit: 20)
    
    // MARK: - Initializer
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupFetch()
    }
    
    override func loadView() {
        super.loadView()
        setupTableView()
    }
    
    // MARK: - Functions
    private func setupBinding() {
        viewModel.updateHandler = tableView.reloadData
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: pokemonCellIdentifier)

        let newRefreshControl = UIRefreshControl()
        newRefreshControl.addTarget(self, action: #selector(setupFetch), for: .valueChanged)

        refreshControl = newRefreshControl
        tableView.refreshControl = refreshControl
    }

    @objc private func setupFetch() {
        viewModel.fetchPokemons(offset: paging.offset,
                                limit: paging.limit)
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: pokemonCellIdentifier, for: indexPath) as? PokemonTableViewCell, let unPokemon = viewModel.getObject(at: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.pokemon = unPokemon
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let threshold = paging.threshold + indexPath.row
        
        if threshold == viewModel.pokemonsCount() {
            paging.offset += paging.limit
            
            viewModel.fetchPokemons(offset: paging.offset, limit: paging.limit)
        }
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didTapPokemon(at: indexPath)
    }
}
