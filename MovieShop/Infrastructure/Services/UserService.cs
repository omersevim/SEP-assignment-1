using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Threading.Tasks;
using ApplicationCore.Entities;
using ApplicationCore.Models.Request;
using ApplicationCore.Models.Response;
using ApplicationCore.RepositoryInterfaces;
using ApplicationCore.ServiceInterfaces;
using Infrastructure.Repositories;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;

namespace Infrastructure.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IPurchaseRepository _purchaseRepository;
        private readonly ICurrentUserService _currentUserService;
        private readonly IMovieRepository _movieRepository;
        public UserService(IUserRepository userRepository, IPurchaseRepository purchaseRepository, ICurrentUserService currentUserService, IMovieRepository movieService)
        {
            _userRepository = userRepository;
            //_movieService = movieService;
            _purchaseRepository = purchaseRepository;
            _currentUserService = currentUserService;
        }

        public async Task<UserRegisterResponseModel> RegisterUser(UserRegisterRequestModel userRegisterRequestModel)
        {
            // first we need to check the email does not exists in our database

            var dbUser = await _userRepository.GetUserByEmail(userRegisterRequestModel.Email);

            if (dbUser != null)
                // email exists in db
                throw new Exception("User already exists, please try to login");

            // generate a unique Salt
            var salt = CreateSalt();

            // hash the password with userRegisterRequestModel.Password + salt from above step
            var hashedPassword = CreateHashedPassword(userRegisterRequestModel.Password, salt);

            // call the user repository to save the user Info

            var user = new User
            {
                FirstName = userRegisterRequestModel.FirstName,
                LastName = userRegisterRequestModel.LastName,
                Email = userRegisterRequestModel.Email,
                DateOfBirth = userRegisterRequestModel.DateOfBirth,
                Salt = salt,
                HashedPassword = hashedPassword
            };

            var createdUser = await _userRepository.Add(user);

            // convert the returned user entity to UserRegisterResponseModel

            var response = new UserRegisterResponseModel
            {
                Id = createdUser.Id,
                FirstName = createdUser.FirstName,
                LastName = createdUser.LastName,
                Email = createdUser.Email
            };

            return response;
        }

        public async Task<UserLoginResponseModel> Login(string email, string password)
        {
            var user = await _userRepository.GetUserByEmail(email);

            if(user == null)
            {//check in the mvc if this returned null.
                return null;
            }

            var hashedPasswoed = CreateHashedPassword(password, user.Salt);
            if(hashedPasswoed == user.HashedPassword)
            {
                //user entered the correct password
                var loginResponseModel = new UserLoginResponseModel
                {
                    Id = user.Id,
                    Email = user.Email,
                    FirstName = user.FirstName,
                    LastName = user.LastName
                };
                return loginResponseModel;
            }
            return null;
        }
        //public async Task<List<MovieCardResponseModel>> GetPurchasedMovies(int id)
        //{
        //    var user = await _userRepository.GetById(id);

        //    if (user.Id != _currentUserService.UserId)
        //    {
        //        return null; //throw exception here
        //    }

        //    var purchasedMovieCardList = new List<MovieCardResponseModel>();
        //    foreach (var purchase in user.Purchases)
        //    {
        //        var movie = _movieService.(id);
        //        purchasedMovieCardList.Add(new MovieCardResponseModel
        //        {
                     
        //        });
        //    }
        //    return null;
        //}
        private string CreateSalt()
        {
            var randomBytes = new byte[128 / 8];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(randomBytes);
            }

            return Convert.ToBase64String(randomBytes);
        }

        private string CreateHashedPassword(string password, string salt)
        {
            var hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                password,
                Convert.FromBase64String(salt),
                KeyDerivationPrf.HMACSHA512,
                10000,
                256 / 8));
            return hashed;
        }
    }
}